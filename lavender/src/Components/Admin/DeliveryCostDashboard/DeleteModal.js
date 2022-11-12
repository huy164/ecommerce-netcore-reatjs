import React from "react";
import "reactjs-popup/dist/index.css";
import Modal from "react-modal";
import * as myToast from "../../../Common/helper/toastHelper";
import * as DeliveryCostApi from "../../apis/delivery";



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

  function submitHandler() {
    DeliveryCostApi
      .deleteCostItem(props.costItem.maphivanchuyen)
      .then((success) => {
        props.deleteFunction(props.costItem);
        props.closeModal();
      })
      .catch((error) => {
        myToast.toastError("Xóa thất bại");
        console.error(error);
      });
  }

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
              Bạn có muốn xoá chi tiết vận chuyển này
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
              Xoá
            </button>
          </div>
        </div>
      </div>
    </Modal>
  );
}
