import React, { Component } from "react";
import "./ThongTinTaiKhoan.css";
import * as customerApi from "../../apis/customer";
import * as myToast from "../../../Common/helper/toastHelper";
import { connect } from "react-redux";
import PropTypes from "prop-types";
import * as khachhangApi from "../../apis/customer";
import { Link } from "react-router-dom";
import Cookies from "universal-cookie";
import LoadingContainer from "../../../Common/helper/loading/LoadingContainer";
import * as imageApi from "../../apis/image";
import * as customerAccountApi from "../../apis/customeraccount";

const cookie = new Cookies();

class index extends Component {
  state = {
    hovaten: "",
    diachi: "",
    ngaysinh: new Date(),
    sdt: "",
    email: "",
    loaikhachhang: "",
    cccd: "",
    loading: true,
    image: undefined,
    imageView: undefined,
    tendangnhap: "",
    password: "",
    newpassword: "",
    repeatnewpassword: "",
    doimatkhau: false,
  };
  luuThayDoi() {
    const fd = new FormData();
    fd.append("makhachhang", this.props.makhachhang);
    fd.append("tenkhachhang", this.state.hovaten);
    fd.append("diachi", this.state.diachi);
    fd.append("cccd", this.state.cccd);
    fd.append(
      "ngaysinh",
      new Date(this.state.ngaysinh).toISOString().split("T")[0]
    );
    if (this.state.imageView !== undefined)
      fd.append("imageview", this.state.imageView);

    const token = cookie.get("token");
    const refreshtoken = cookie.get("refreshtoken");
    customerApi
      .thayDoiThongTin(fd, token, refreshtoken)
      .then((success) => {
        if (success.status === 200) {
          myToast.toastSucces("Thay đổi thông tin thành công");
        } else myToast.toastError("Thay đổi thông tin thất bại");
      })
      .catch((error) => {
        myToast.toastError("Thay đổi thông tin thất bại");
        console.error(error);
      });
  }
  async componentDidMount() {
    await khachhangApi
      .findCustomerByCustomerId(this.props.makhachhang)
      .then((success) => {
        if (success.status === 200) {
          this.setState({
            hovaten: success.data.value.tenkhachhang,
            diachi: success.data.value.diachi,
            ngaysinh: new Date(success.data.value.ngaysinh),
            email: success.data.value.email,
            sdt: success.data.value.sodienthoai,
            cccd: success.data.value.cccd,
            loaikhachhang: success.data.value.loaikhachhang,
            image: success.data.value.image,
          });
        }
      })
      .catch((error) => {
        console.error(error);
      });
    this.setState({ loading: false });
  }

  changePassword() {
    myToast.toastLoading();
    const fd = new FormData();
    fd.append("makhachhang", this.props.makhachhang);
    fd.append("username", this.state.tendangnhap);
    fd.append("password", this.state.password);
    fd.append("newpassword", this.state.newpassword);
    var token = cookie.get("token");
    var refreshtoken = cookie.get("refreshtoken");
    customerAccountApi
      .changePassword(fd, token, refreshtoken)
      .then((success) => {
        if (success.status === 200) {
          myToast.toastSucces("Đổi mật khẩu thành công");
        }
      })
      .catch((error) => {
        console.error(error);
        myToast.toastError("Đổi mật khẩu thất bại");
      });
  }
  render() {
    return (
      <div className="Account__StyledAccountLayoutInner-sc-1d5h8iz-1 jXurFV">
        <LoadingContainer loading={this.state.loading}></LoadingContainer>
        <div className="styles__StyledHeading-sc-s5c7xj-0 geNdhL">
          Thông tin tài khoản
        </div>
        <div className="styles__StyleInfoPage-sc-s5c7xj-1 dfHeIP">
          <div className="info">
            <div className="info-left">
              <span className="info-title">Thông tin cá nhân</span>

              <div className=" border-right">
                <div className="d-flex flex-column align-items-center text-center p-3">
                  <img
                    alt="không có avatar"
                    className="rounded-circle"
                    width="150px"
                    src={
                      this.state.imageView === undefined
                        ? this.state.image === "/khachhang"
                          ? imageApi.image(
                              this.state.image,
                              this.props.makhachhang
                            )
                          : this.state.image
                        : URL.createObjectURL(this.state.imageView)
                    }
                  />

                  <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-center mt-2 ">
                    <input
                      className="form-control border"
                      type="file"
                      placeholder=""
                      onChange={(e) =>
                        this.setState({ imageView: e.target.files[0] })
                      }
                    ></input>
                  </div>
                </div>
              </div>
              <div className=" border-right">
                <div className="p-3 py-5">
                  <div className="d-flex justify-content-between align-items-center mb-3">
                    <h4 className="text-right">Thông tin nhân viên</h4>
                  </div>
                  <div className="row mt-2">
                    <div className="col-md-6">
                      <label className="labels">Họ và tên</label>
                      <input
                        type="text"
                        className="form-control border"
                        defaultValue
                        value={this.state.hovaten}
                        onChange={(e) =>
                          this.setState({ hovaten: e.target.value })
                        }
                      />
                    </div>

                    <div className="col-md-6">
                      <label className="labels">Ngày sinh</label>
                      <input
                        type="date"
                        className="form-control border"
                        defaultValue
                        onChange={(e) => {
                          this.setState({ ngaysinh: new Date(e.target.value) });
                        }}
                        value={this.state.ngaysinh.toISOString().split("T")[0]}
                      />
                    </div>
                  </div>

                  <div className="col-md-12">
                    <label className="labels">CCCD</label>
                    <input
                      type="text"
                      className="form-control border"
                      defaultValue
                      onChange={(e) => {
                        this.setState({ cccd: e.target.value });
                      }}
                      value={this.state.cccd}
                    />
                  </div>

                  <div className="col-md-12">
                    <label className="labels">Địa chỉ</label>
                    <input
                      type="text"
                      className="form-control border"
                      defaultValue
                      onChange={(e) => {
                        this.setState({ diachi: e.target.value });
                      }}
                      value={this.state.diachi}
                    />
                  </div>
                  <div className="col-md-12">
                    <label className="labels">Loại khách hàng</label>
                    <input
                      type="text"
                      className="form-control"
                      disabled
                      value={this.state.loaikhachhang}
                      defaultValue
                    />
                  </div>

                  <div className="mt-5 text-center">
                    <button
                      className="btn btn-primary profile-button"
                      type="button"
                      onClick={this.luuThayDoi.bind(this)}
                    >
                      Lưu thay đổi
                    </button>
                  </div>
                </div>
              </div>
            </div>
            <div className="info-vertical" />
            <div className="info-right">
              <span className="info-title">Số điện thoại và Email</span>
              <div className="styles__StyledListItem-sc-s5c7xj-4 lCUBE">
                <div className="list-item">
                  <div className="info">
                    <img
                      src="https://frontend.tikicdn.com/_desktop-next/static/img/account/phone.png"
                      className="icon"
                      alt=""
                    />
                    <div className="detail">
                      <span>Số điện thoại</span>
                      <span>{this.state.sdt}</span>
                    </div>
                  </div>
                  <div className="status" >
                    <span />
                    <Link
                      to="/lmember/thongtintaikhoan/sdt"
                      className="btn btn-primary "  
                    >
                      Sửa
                    </Link>
                  </div>
                </div>

                <div className="list-item">
                  <div className="info">
                    <img
                      src="https://frontend.tikicdn.com/_desktop-next/static/img/account/email.png"
                      className="icon"
                      alt=""
                    />
                    <div className="detail">
                      <span>Địa chỉ email</span>
                      <span>{this.state.email}</span>
                    </div>
                  </div>
                  <div className="status">
                    <span />
                    <Link
                      to="/lmember/thongtintaikhoan/email"
                      className="btn btn-primary"
                    >
                      Sửa
                    </Link>
                  </div>
                </div>
              </div>
              <span className="info-title">Bảo mật</span>
              <div className="">
                <div className="p-3 py-5">
                  <div className="d-flex justify-content-between align-items-center ">
                    <span>Tài khoản</span>
                    <span
                      className="border rounded px-3 p-1 row"
                      onClick={() =>
                        this.setState({ doimatkhau: !this.state.doimatkhau })
                      }
                      style={{ cursor: "pointer" }}
                    >
                      <i class="fas fa-edit"></i>
                      &nbsp;Đổi mật khẩu
                    </span>
                  </div>
                  <br />

                  {this.state.doimatkhau && (
                    <>
                      <br />
                      <div className="col-md-12">
                        <label className="labels">Tên đăng nhập</label>
                        <input
                          type="text"
                          className="form-control border"
                          placeholder=""
                          defaultValue
                          value={this.state.tendangnhap}
                          onChange={(e) =>
                            this.setState({ tendangnhap: e.target.value })
                          }
                        />
                      </div>
                      <div className="col-md-12">
                        <label className="labels">Mật khẩu</label>
                        <input
                          type="password"
                          className="form-control border"
                          placeholder=""
                          defaultValue
                          value={this.state.password}
                          onChange={(e) =>
                            this.setState({ password: e.target.value })
                          }
                        ></input>
                      </div>

                      <div className="col-md-12">
                        <label className="labels">Mật khẩu mới</label>
                        <input
                          type="password"
                          className="form-control border"
                          placeholder=""
                          defaultValue
                          value={this.state.newpassword}
                          onChange={(e) =>
                            this.setState({ newpassword: e.target.value })
                          }
                        ></input>
                      </div>
                      <div className="col-md-12">
                        <label className="labels">Nhập lại mật khẩu</label>

                        <input
                          type="password"
                          className="form-control border"
                          placeholder=""
                          defaultValue
                          value={this.state.repeatnewpassword}
                          onChange={(e) => {
                            this.setState({
                              repeatnewpassword: e.target.value,
                            });
                          }}
                        ></input>
                        {this.state.newpassword !==
                          this.state.repeatnewpassword && (
                          <label className="labels mx-1 row text-danger">
                            Mật khẩu không khớp
                          </label>
                        )}
                      </div>
                      <div className=" text-center">
                        {" "}
                        <button
                          className="btn btn-info mt-4"
                          onClick={this.changePassword.bind(this)}
                        >
                          Đổi mật khẩu
                        </button>
                      </div>
                    </>
                  )}
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
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

export default connect(mapStateToProps)(index);
