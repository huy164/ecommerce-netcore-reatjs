import React, { Component } from "react";
import "./style.css";
import Product from "./Product.js";
import { withRouter, Redirect } from "react-router-dom";
import { connect } from "react-redux";
import PropTypes from "prop-types";
import * as cartApi from "../apis/cart";
import * as detailCartApi from "../apis/detailCart";
import * as detailProductApi from "../apis/detailProduct";
import * as billingApi from "../apis/billing";
import AddVoucherModal from "./AddVoucherModal";
import DeleteAllModal from "./DeleteAllModal";
import * as myToast from "../../Common/helper/toastHelper";
import LoadingContainer from "../../Common/helper/loading/LoadingContainer";
import Cookies from "universal-cookie";
import * as customerApi from "../apis/customer";
import * as numberHelper from "../../Common/helper/numberHelper";
import ReactCanvasConfetti from "react-canvas-confetti";
import Delivery from "../Delivery/index";
import Paypal from "../Checkout/Paypal";
import { PayPalScriptProvider } from "@paypal/react-paypal-js";
import { PAYPAY_CLIENT_ID } from "../../Common/constants/index";
import { CLIENT_ENDPOINT } from "../../Common/constants/index";


var cookie = new Cookies();
const style = {
  position: "fixed",
  width: "1000px",
  height: "1000px",
  zIndex: -1,
};
class index extends Component {
  state = {
    cart: undefined,
    detailCarts: [],
    tongtien: 0,
    voucherModalIsOpen: false,
    khuyenmai: undefined,
    phivanchuyen: 0,
    diachi: "",
    tongcong: 0,
    checkall: false,
    showModal: false,
    loading: true,
    khachhang: undefined,
    fire: false,
    reset: false,
  };



  
  changePhiVanChuyen(cost) {
    this.setState({ phivanchuyen: cost });
  }

  async loadCart() {
    this.setState({ loading: true });
    let cart = undefined;
    var token = cookie.get("token");
    var refreshtoken = cookie.get("refreshtoken");

    await cartApi
      .loadCart(this.props.makhachhang, token, refreshtoken)
      .then((success) => {
        if (success.status === 200) {
          cart = success.data.value;
        }
      })
      .catch((error) => {
        console.error(error);
      });

    if (cart === undefined || cart.lenght === 0) {
      this.setState({ cart: {}, loading: false });
      return;
    }
    token = cookie.get("token");
    refreshtoken = cookie.get("refreshtoken");

    let detailCarts = undefined;
    await detailCartApi
      .loadDetailCartByCartId(cart.magiohang, token, refreshtoken)
      .then((success) => {
        if (success.status === 200) {
          if (
            success.data.value !== undefined &&
            success.data.value.$values !== undefined
          )
            detailCarts = success.data.value.$values;
        }
      })
      .catch((error) => {
        console.error(error);
      });

    if (detailCarts === undefined) {
      this.setState({ detailCarts: [] });
      return;
    }

    var carttemp = [];

    for (var i = 0; i < detailCarts.length; i++) {
      await detailProductApi
        .xemgiatheodungluongmausacmasanpham(
          detailCarts[i].masanpham,
          detailCarts[i].dungluong,
          detailCarts[i].mausac
        )
        .then((success) => {
          if (success.status === 200) {
            var temp = {
              ...detailCarts[i],
              chon: false,
              tien: success.data.value,
            };
            carttemp.push(temp);
          }
        })
        .catch((error) => {
          console.error(error);
        });
    }

    this.setState({ cart: cart, detailCarts: carttemp, loading: false });
  }

  muaHang() {
    if (this.state.tongcong === 0) {
      myToast.toastError("Chọn sản phẩm");
      return;
    }
    if (
      this.state.khachhang.sodienthoai === undefined ||
      this.state.khachhang.sodienthoai === null ||
      this.state.khachhang.sodienthoai === "null"
    ) {
      this.props.history.push("/lmember/thongtintaikhoan/sdt");
    }
    var danhsachsanpham = [];
    var makhuyenmai =
      this.state.khuyenmai === undefined ? 0 : this.state.khuyenmai.makhuyenmai;
    var tempcarts = this.state.detailCarts;
    for (var i = 0; i < tempcarts.length; i++) {
      if (tempcarts[i].chon) {
        danhsachsanpham.push({
          masanpham: tempcarts[i].masanpham,
          dungluong: tempcarts[i].dungluong,
          mausac: tempcarts[i].mausac,
          soluong: tempcarts[i].soluong,
        });
      }
    }
    var token = cookie.get("token");
    var refreshtoken = cookie.get("refreshtoken");
    billingApi
      .muaHang(
        this.props.makhachhang,
        makhuyenmai,
        this.state.phivanchuyen,
        this.state.tongcong.toFixed(0),
        danhsachsanpham,
        token,
        refreshtoken
      )
      .then((success) => {
        if (
          success.status === 200 &&
          success.data.value.tinhtrang === "thanhcong"
        ) {
          myToast.toastSucces("Mua hàng thành công");
          this.loadCart();
          return;
        }
        if (
          success.status === 200 &&
          success.data.value.tinhtrang === "hethang"
        ) {
          myToast.toastError("Hết hàng");
          return;
        }
      })
      .catch((error) => {
        myToast.toastError("Mua hàng thất bại");
        console.error(error);
      });
  }

  async deleteAllProduct() {
    this.setState({ loading: true });
    var token = cookie.get("token");
    var refreshtoken = cookie.get("refreshtoken");
    await detailCartApi
      .deleteAllDetailCart(this.state.cart.magiohang, token, refreshtoken)
      .then((success) => {
        if (success.status === 200) this.loadCart();
      })
      .catch((error) => {
        console.error(error);
      });
    this.setState({ loading: false });
  }

  showModal() {
    this.setState({ showModal: true });
  }

  closeModal() {
    this.setState({ showModal: false });
  }

  async chonKhuyenmai(khuyenmai) {
    await this.setState({ khuyenmai: khuyenmai });
    await this.tinhTien();
  }

  pushProduct() {
    let result = null;
    result = this.state.detailCarts.map((value, key) => {
      return (
        <Product
          detailCart={value}
          key={key}
          changeQuantity={this.changeQuantity.bind(this)}
          changeSelect={this.changeSelect.bind(this)}
          reload={this.loadCart.bind(this)}
        ></Product>
      );
    });
    return result;
  }



  async changeQuantity(masanpham, dungluong, mausac, quantity) {
    let detailCartsTemp = this.state.detailCarts;

    for (let i = 0; i < detailCartsTemp.length; i++) {
      if (
        detailCartsTemp[i].masanpham === masanpham &&
        detailCartsTemp[i].dungluong === dungluong &&
        detailCartsTemp[i].mausac === mausac
      ) {
        detailCartsTemp[i].soluong = quantity;
        await this.setState({ detailCarts: detailCartsTemp });
        break;
      }
    }
    await this.tinhTien(
    );
  }

  async changeSelect(masanpham, dungluong, mausac, checked) {
    var detailcartstemp = this.state.detailCarts;
    for (var i = 0; i < detailcartstemp.length; i++) {
      if (
        detailcartstemp[i].masanpham === masanpham &&
        detailcartstemp[i].dungluong === dungluong &&
        detailcartstemp[i].mausac === mausac
      ) {
        detailcartstemp[i].chon = checked;
      }
    }
    this.tinhTien();
    var check = true;
    for (var j = 0; j < detailcartstemp.length; j++) {
      if (detailcartstemp[j].chon === false) {
        check = false;
        break;
      }
    }
    await this.setState({ detailCarts: detailcartstemp, checkall: check });
  }

  async tinhTien(phivanchuyen) {
    if (phivanchuyen === undefined) {
      phivanchuyen = 0;
    }
    var tongtien = 0;
    var detailcartstemp = this.state.detailCarts;
    for (var i = 0; i < detailcartstemp.length; i++) {
      if (detailcartstemp[i].chon) {
        tongtien += detailcartstemp[i].tien * detailcartstemp[i].soluong;
      }
    }
    let tongcong = 0;
    tongcong =
      this.state.khuyenmai === undefined
        ? tongtien + phivanchuyen
        : tongtien - this.state.khuyenmai.tilekhuyenmai * tongtien + phivanchuyen;

    this.setState({ tongtien: tongtien, tongcong: tongcong });
  }

  async loadCustomer() {
    var token = cookie.get("token");
    var refreshtoken = cookie.get("refreshtoken");

    customerApi
      .findCustomerByCustomerId(this.props.makhachhang, token, refreshtoken)
      .then((success) => {
        if (success.status === 200) {
          this.setState({ khachhang: success.data.value });
        }
      })
      .catch((error) => {
        console.error(error);
      });
  }

  async componentDidMount() {
    if (this.props.makhachhang === undefined) {
      return;
    }
    this.loadCustomer();
    this.loadCart();
  }

  selectAll() {
    var detailcartstemp = this.state.detailCarts;
    for (var i = 0; i < detailcartstemp.length; i++) {
      detailcartstemp[i].chon = true;
      this.setState({ detailCarts: detailcartstemp });
    }
  }

  openVoucherModal() {
    this.setState({ voucherModalIsOpen: true });
  }

  closeVoucherModal() {
    this.setState({ voucherModalIsOpen: false });
  }
  async changeCheck(checked) {
    var detailcartstemp = this.state.detailCarts;

    for (var j = 0; j < detailcartstemp.length; j++) {
      detailcartstemp[j].chon = checked;
    }

    await this.setState({ detailCarts: detailcartstemp, checkall: checked });
    this.tinhTien();
  }
  render() {

    return (
      <>
        <LoadingContainer loading={this.state.loading}></LoadingContainer>
        <DeleteAllModal
          showModal={this.state.showModal}
          closeModal={this.closeModal.bind(this)}
          deleteAllProduct={this.deleteAllProduct.bind(this)}
        ></DeleteAllModal>

        <section>
          {this.props.makhachhang === undefined && (
            <Redirect to="/login"></Redirect>
          )}


          {!this.state.fire ? (
            <div className="cart">
              <div className="container">
                <div className="row">
                  <div className="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                    <div className="cart-inner">
                      <div className="styles__StyledProductsV2-sc-rkft9e-0 dioUnE">
                        <h4 className="productsV2__title">Giỏ hàng</h4>
                        <div className="productsV2-heading box-shadow">
                          <div className="row">
                            <div className="col-1">
                              <label className="">
                                <input
                                  className="round"
                                  type="checkbox"
                                  id="checkall"
                                  onChange={(e) =>
                                    this.changeCheck(e.target.checked)
                                  }
                                  checked={this.state.checkall}
                                />
                              </label>
                            </div>
                            <div className="col-2">
                              <strong>Đơn giá</strong>
                            </div>
                            <div className="col-3">
                              <strong>Số lượng</strong>
                            </div>
                            <div className="col-5">
                              <span className="productsV2__remove-all">
                                <img
                                  src="https://frontend.tikicdn.com/_desktop-next/static/img/icons/trash.svg"
                                  alt="deleted"
                                  onClick={this.showModal.bind(this)}
                                />
                              </span>
                            </div>
                          </div>
                        </div>
                        <div className="productsV2-content pink-shadow">
                          <div>
                            <div
                              className="infinite-scroll-component "
                              style={{ height: "auto", overflow: "auto" }}
                            >
                              <div className="styles__StyledIntendedSeller-sc-1dwh2vk-0 kTsjPS">
                                <div className="sellers">
                                  <div className="pustProduct">
                                    {this.pushProduct()}
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>

                  <div className="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                    <div className="cart-total-prices">
                      <div className="cart-total-prices__inner">
                        <div className="styles__StyledWrapCoupons-sc-1d6idyr-0 ekRzNN box-shadow">
                          <AddVoucherModal
                            modalIsOpen={this.state.voucherModalIsOpen}
                            customer={this.props}
                            closeModal={this.closeVoucherModal.bind(this)}
                            chonKhuyenmai={this.chonKhuyenmai.bind(this)}
                          ></AddVoucherModal>
                          <div className="styles__StyledCouponBox-sc-1ibe03g-0 jmylnB"
                            onClick={this.openVoucherModal.bind(this)}
                          >
                            <div className="title-usage">
                              <p className="coupon-title">
                                <strong>Khuyến mãi</strong>
                              </p>
                              <p className="max-usage">
                                Có thể chọn 1
                                <img
                                  className="max-usage__info"
                                  src="https://frontend.tikicdn.com/_desktop-next/static/img/mycoupon/icons-info-gray.svg"
                                  alt="info"
                                />
                              </p>
                            </div>
                            <div
                              className="eligible_coupon_list"
                              data-view-id="platform_coupon"
                            />
                            <div
                              data-view-id="platform_coupon.cart_coupon_view.all"
                              className="show-more"
                            >
                              <img
                                alt=""
                                src="https://frontend.tikicdn.com/_desktop-next/static/img/mycoupon/coupon_icon.svg"
                              />
                              <span>
                                {this.state.khuyenmai === undefined
                                  ? "Chọn hoặc nhập Khuyến mãi"
                                  : "Giảm " +
                                  (
                                    this.state.khuyenmai.tilekhuyenmai * 100
                                  ).toFixed(0) +
                                  "%"}{" "}
                              </span>
                            </div>
                          </div>
                        </div>
                        <div className="styles__StyledCartPrices-sc-1op1gws-0 cdzcxd box-shadow">
                          <div className="prices">
                            <ul className="prices__items">
                              <li className="prices__item">
                                <span className="prices__text">
                                  <strong>Tạm tính</strong>
                                </span>
                                <span className="prices__value">
                                  {numberHelper.numberWithCommas(
                                    this.state.tongtien
                                  )}
                                  đ
                                </span>
                              </li>
                              <li className="prices__item">
                                <span className="prices__text">
                                  <strong>Giảm giá</strong>
                                </span>
                                <span className="prices__value">
                                  {this.state.khuyenmai === undefined
                                    ? "0"
                                    : numberHelper.numberWithCommas(
                                      (this.state.khuyenmai.tilekhuyenmai *
                                        this.state.tongtien).toFixed(0)
                                    )}đ
                                </span>
                              </li>
                            </ul>
                            <div className="px-2">
                              <Delivery
                                changePhiVanChuyen={this.changePhiVanChuyen.bind(this)}
                                tinhTien={this.tinhTien.bind(this)} />
                            </div>
                            <div className="prices__total">
                              <span className="prices__text">
                                <strong>Tổng cộng</strong>
                              </span>
                              <div className="prices__content">
                                <div className="prices__value prices__value--empty">
                                  <strong>
                                    {this.state.tongcong === 0
                                      ? "Vui lòng chọn sản phẩm"
                                      : numberHelper.numberWithCommas(this.state.tongcong.toFixed(0)) + "đ"}
                                  </strong>
                                </div>
                                <span className="prices__value--noted">
                                  (Đã bao gồm VAT nếu có)
                                </span>
                              </div>
                            </div>
                          </div>
                        </div>
                          <PayPalScriptProvider options={{ "client-id": PAYPAY_CLIENT_ID }}>
                            <Paypal tongcong={this.state.tongcong}
                              muaHang={this.muaHang.bind(this)} />
                          </ PayPalScriptProvider>
                        {/* <button
                          data-view-id="cart_navigation_proceed box-shadow"
                          data-view-label='{"shipping_salerules":[]}'
                          type="button"
                          className="cart__submit"
                          onClick={this.muaHang.bind(this)}
                        >
                          Đặt hàng
                        </button> */}
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          ) : (<div className="" style={{ height: "2000px" }}>
            <button className="btn btn-success" onClick={() => this.setState({ fire: false })}>
              <i class="fad fa-angle-left"></i>
              {"  "}Quay lại mua hàng
            </button>
          </div>)}
        </section>
      </>
    );
  }
}
index.propTypes = {
  makhachhang: PropTypes.string,
};

const mapStateToProps = (state) => {
  return {
    makhachhang: state.login.makhachhang,
  };
};

export default connect(mapStateToProps)(withRouter(index));
