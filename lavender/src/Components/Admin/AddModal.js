import React, { useEffect, useState } from "react";
import { useSelector } from "react-redux";
import "reactjs-popup/dist/index.css";
import Modal from "react-modal";
import * as myToast from "../../Common/helper/toastHelper";
import "./style.css";
import Cookies from "universal-cookie";
import * as billApi from "../apis/billing";
import * as detailBillApi from "../apis/detailBill";
import DetailBillItem from "./DetailBillItem";

const cookie = new Cookies();

const customStyles = {
  content: {
    top: "40%",
    left: "50%",
    right: "auto",
    bottom: "auto",
    marginRight: "-50%",
    transform: "translate(-50%, -50%)",
  },
};

export default function AddModal(props) {
  const manhanvien = useSelector((state) => state.login.manhanvien);
  const [detailBill, setDetailBill] = useState([]);
  function submitHandler() {
    var token = cookie.get("token");
    var refreshtoken = cookie.get("refreshtoken");
    billApi
      .tiepnhanDonhang(
        props.bill.sohoadon,
        manhanvien,
        token,
        refreshtoken
      )
      .then((success) => {
        if (success.status === 200) {
          myToast.toastSucces("Tiếp nhận đơn hàng thành công");
          props.addFunction();
          props.closeModal();
        }
      })
      .catch((error) => {
        console.error(error);
        myToast.toastError("Tiếp nhận đơn hàng thất bại");
      });
  }

  useEffect(() => {
    detailBillApi
      .detailByBillId(
        props.bill.sohoadon,
        cookie.get("token"),
        cookie.get("refreshtoken")
      )
      .then((success) => {
        if (success.status === 200) {
          setDetailBill(success.data.value.$values);
        }
      })
      .catch((error) => {
        console.error(error);
      });
  }, [props.bill]);
  return (
    <Modal
      isOpen={props.showModal}
      onRequestClose={props.closeModal}
      style={customStyles}
      contentLabel="Example Modal"
    >
 
      <div class="add-item-modal tiepnhanhoadonmodal" role="document">
        <div class="">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle">
              Tiếp nhận và chuẩn bị đơn hàng
            </h5>
          </div>
          {props.bill !== undefined && props.customer !== undefined && (
            <div className="form-main-add-edit">
              <div className="row mt-2">
                <div className="col-md-6">
                  <label className="labels">Mã khách hàng</label>
                  <input
                    type="text"
                    className="form-control border"
                    defaultValue
                    disabled
                    value={props.customer.makhachhang}
                  />
                </div>
                <div className="col-md-6">
                  <label className="labels">Tên khách hàng</label>
                  <input
                    type="tel"
                    className="form-control border"
                    defaultValue
                    disabled
                    value={props.customer.tenkhachhang}
                  />
                </div>
              </div>
              <div className="row mt-2">
                <div className="col-md-6">
                  <label className="labels">Số điện thoại</label>
                  <input
                    type="text"
                    className="form-control border"
                    defaultValue
                    disabled
                    value={props.customer.sodienthoai}
                  />
                </div>
                <div className="col-md-6">
                  <label className="labels">Email</label>
                  <input
                    type="tel"
                    className="form-control border"
                    defaultValue
                    disabled
                    value={props.customer.email}
                  />
                </div>

                <div className="col-md-6">
                  <label className="labels">Địa chỉ</label>
                  <input
                    type="tel"
                    className="form-control border"
                    defaultValue
                    disabled
                    value={props.customer.diachi}
                  />
                </div>

                <div className="col-md-6">
                  <label className="labels">Ngày sinh</label>
                  <input
                    type="tel"
                    className="form-control border"
                    defaultValue
                    disabled
                    value={props.customer.ngaysinh.split("T")[0]}
                  />
                </div>
              </div>

              {detailBill.map((value, key) => {
                return (
                  <DetailBillItem key={key} detail={value}></DetailBillItem>
                );
              })}
            </div>
          )}

          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              data-dismiss="modal"
              onClick={props.closeModal}
            >
              Đóng
            </button>
            <button
              type="button"
              class="btn btn-primary"
              onClick={submitHandler}
            >
              Đồng ý
            </button>
          </div>
        </div>
      </div>
    </Modal>
  );
}
