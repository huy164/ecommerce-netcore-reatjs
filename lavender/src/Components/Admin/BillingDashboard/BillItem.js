import React, { Component } from "react";
import * as productApi from "../../apis/product";
import * as customerApi from "../../apis/customer";
import AddBill from "./AddBill";
import DeleteBill from "./DeleteBill";
import Cookies from "universal-cookie";
import * as transportApi from "../../apis/transport";
import { numberWithCommas } from "../../../Common/helper/numberHelper";
const cookie = new Cookies();

export default class BillItem extends Component {
  state = {
    product: undefined,
    customer: undefined,
    modal: 0,
    vanchuyen: undefined,
  };
  async componentDidMount() {
    var task1 = () => {
      var token = cookie.get("token");
      var refreshtoken = cookie.get("refreshtoken");
      productApi
        .findProductByBillId(this.props.bill.sohoadon, token, refreshtoken)
        .then((success) => { })
        .catch((error) => {
          console.error(error);
        });
    };
    var task2 = () => {
      var token = cookie.get("token");
      var refreshtoken = cookie.get("refreshtoken");
      customerApi
        .findCustomerByBillId(this.props.bill.sohoadon, token, refreshtoken)
        .then((success) => {
          this.setState({ customer: success.data.value });
        })
        .catch((error) => {
          console.error(error);
        });
    };

    var task3 = () => {
      transportApi
        .vanchuyenBangSohoadon(this.props.bill.sohoadon)
        .then((success) => {
          if (success.status === 200) {
            this.setState({ vanchuyen: success.data.value });
          }
        })
        .catch((error) => {
          console.error(error);
        });
    };
    Promise.allSettled([task1(), task2(), task3()]);
  }

  showModal = (index) => {
    this.setState({ modal: index });
  };
  hideModal = () => {
    this.setState({ modal: 0 });
  };
  render() {
    return (
      <>
        {(() => {
          if (this.state.modal === 1)
            return (
              <AddBill
                handleClose={this.hideModal.bind(this)}
                handleSave={() => {
                  this.hideModal.bind(this)();
                  this.props.handleSave();
                }}
                bill={this.props.bill}
                transport={this.state.vanchuyen}
              ></AddBill>
            );
          else if (this.state.modal === 2)
            return (
              <DeleteBill
                handleClose={this.hideModal.bind(this)}
                handleSave={() => {
                  this.hideModal.bind(this)();
                  this.props.handleSave();
                }}
                bill={this.props.bill}
              ></DeleteBill>
            );
        })()}
        <li className="list-group-item border-0 d-flex p-4 bg-gray-100 border-radius-lg ">
          <div className="d-flex flex-column">
            <h6 className="text-sm">
              SOHD: {this.props.bill.sohoadon} - {"  "}
              {(this.state.customer !== undefined) &
                (this.state.customer !== null) &&
                this.state.customer.tenkhachhang}
            </h6>
            <span className=" mt-2 text-xs">
            Trạng thái :{" "}
              <span className="text-dark ms-sm-2 font-weight-bold">
                {this.state.vanchuyen !== undefined &&
                  this.state.vanchuyen !== null &&
                  this.state.vanchuyen.trangthai !== undefined &&
                  this.state.vanchuyen.trangthai !== null &&
                  this.state.vanchuyen.trangthai}
              </span>
            </span>
            <span className="mb-2 text-xs">
              Số điện thoại:{" "}
              <span className="text-dark font-weight-bold ms-sm-2">
                {(this.state.customer !== undefined) &
                  (this.state.customer !== null) &&
                  this.state.customer.sodienthoai}
              </span>
            </span>
            <span className="mb-2 text-xs">
              Email:{" "}
              <span className="text-dark ms-sm-2 font-weight-bold">
                {(this.state.customer !== undefined) &
                  (this.state.customer !== null) && this.state.customer.email}
              </span>
            </span>
            <span className=" mt-2 text-xs">
              Ngày hoá đơn:{" "}
              <span className="text-dark ms-sm-2 font-weight-bold">
                {this.props.bill.ngayhoadon}
              </span>
            </span>
            <span className=" mt-2 text-xs">
              Tổng tiền:{" "}
              <span className="text-dark ms-sm-2 font-weight-bold">
                {numberWithCommas(this.props.bill.tongtien)}
              </span>
            </span>
          </div>
          <div className="ms-auto text-end">
            <div
              className="btn btn-link text-dark px-3 mb-0"
              onClick={() => this.showModal(1)}
            >
              <i class="bi bi-pencil-square"></i>
              {"  "}Xem
            </div>
            <div
              className="btn btn-link text-danger text-gradient px-3 mb-0"
              onClick={() => this.showModal(2)}
            >
              <i class="bi bi-trash"></i>
              {"  "}Xóa
            </div>
          </div>
        </li>
      </>
    );
  }
}
