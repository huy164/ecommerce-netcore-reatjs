import React, { Component } from "react";
import { connect } from "react-redux";
import PropTypes from "prop-types";
import * as khachhangApi from "../../apis/customer";
import * as myToast from "../../../Common/helper/toastHelper";
import Cookies from "universal-cookie";

const cookie = new Cookies();

class ThayDoiSDT extends Component {
  state = { sdt: "", otp_generated:Math.floor(Math.random() * (999999 - 100000 + 1)) + 100000, opt_entered: 0 };
  async componentDidMount() {
    await khachhangApi
      .findCustomerByCustomerId(this.props.makhachhang)
      .then((success) => {
        if (success.status === 200) {
          this.setState({ sdt: success.data.value.sodienthoai });
        }
      })
      .catch((error) => {
        console.error(error);
      });
  }
  guiOTP() {
    khachhangApi
      .guiOTP(
        this.state.otp_generated,
        this.state.sdt
      )
      .then((success) => {
        if (success.status === 200) {
          myToast.toastSucces("Đã gửi OTP đến "+this.state.sdt);
        }
      })
      .catch((error) => {
        console.error("lỗi gửi otp : " + error);
      });
  };

  luuThayDoi() {
    // console.log("opt enter:"+this.state.opt_entered)
    // console.log("opt generate:"+this.state.otp_generated)
    if (this.state.opt_entered == this.state.otp_generated) {
      var token = cookie.get('token');
      var refreshtoken = cookie.get('refreshtoken');
      khachhangApi
        .thayDoiSDT(
          this.props.makhachhang,
          this.state.sdt,
          token, refreshtoken
        )
        .then((success) => {
          if (success.status === 200) {
            myToast.toastSucces("Thay đổi số điện thoại thành công");
          } else {
            myToast.toastError("Thay đổi số điện thoại thất bại");
          }
        })
        .catch((error) => {
          myToast.toastError("Thay đổi số điện thoại thất bại");
          console.error(error);
        });
    }
    else {
      myToast.toastError("Mã OTP không khớp");
    }
  }
  render() {
    return (
      <section className="styles__StyleInfoPage-sc-1ylk51y-0 DWfPE">
        <div className="form">
          <div className="form-control border rounded">
            <label className="input-label">Số điện thoại</label>
            <div>
              <div className="styles__StyledInput-sc-s5c7xj-5 hisWEc">
                <img
                  src="https://frontend.tikicdn.com/_desktop-next/static/img/account/phone.png"
                  className="icon-left"
                  alt=""
                />
                <input
                  name="phone"
                  maxLength={10}
                  placeholder="Nhập số điện thoại"
                  type="search"
                  className="input with-icon-left "
                  onChange={(e) => this.setState({ sdt: e.target.value })}
                  defaultValue={this.state.sdt}
                />
                <button
                  className="btn btn-warning"
                  onClick={this.guiOTP.bind(this)}
                >
                  Gửi OTP
                </button>
                <input
                  name="otp_entered"
                  maxLength={10}
                  placeholder="Nhập mã OTP gồm 6 chữ số"
                  type="text"
                  className="input with-icon-left "
                  onChange={(e) => this.setState({ opt_entered: e.target.value })}
                />
                <div className="hint-message">&nbsp;&nbsp;</div>
              </div>
            </div>
            <button
              className="btn btn-success"
              onClick={this.luuThayDoi.bind(this)}
            >
              Hoàn tất
            </button>
          </div>
        </div>
      </section>
    );
  }
}
ThayDoiSDT.propTypes = {
  makhachhang: PropTypes.object,
};

const mapStateToProps = (state) => {
  return {
    makhachhang: state.login.makhachhang,
  };
};
export default connect(mapStateToProps)(ThayDoiSDT);
