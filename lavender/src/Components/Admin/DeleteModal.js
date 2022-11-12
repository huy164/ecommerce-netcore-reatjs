import React from "react";
import "reactjs-popup/dist/index.css";
import Modal from "react-modal";
import * as myToast from "../../Common/helper/toastHelper";
import Cookies from "universal-cookie";
import * as billingApi from "../apis/billing";

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

export default function DeleteModal(props) {
  const submitHandler = () => {
    billingApi
      .tuchoiDonhang(
        props.bill.sohoadon,
        cookie.get("token"),
        cookie.get("refreshtoken")
      )
      .then((success) => {
        if (success.status === 200) {
          myToast.toastSucces("Đơn hàng đã bị huỷ");
          props.deleteFunction();
          props.closeModal();
        }
      })
      .catch((error) => {
        console.log(error);
        myToast.toastError("Lỗi không huỷ được đơn hàng");
      });
  };
  return (
    <Modal
      isOpen={props.showModal}
      onRequestClose={props.closeModal}
      style={customStyles}
      contentLabel="Example Modal"
    >
      <div class="add-item-modal khachhangmodal" role="document">
        <div class="">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle">
              Bạn chắc chắn muốn từ chối đơn hàng này
            </h5>
          </div>

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
              Từ chối
            </button>
          </div>
        </div>
      </div>
    </Modal>
  );
}
