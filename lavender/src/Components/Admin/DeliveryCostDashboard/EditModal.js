import React, { useState, useEffect } from "react";
import "reactjs-popup/dist/index.css";
import Modal from "react-modal";
import * as DeliveryCostApi from "../../apis/delivery";
import * as myToast from "../../../Common/helper/toastHelper";



const customStyles = {
  content: {
    top: "50%",
    left: "50%",
    right: "auto",
    bottom: "auto",
    height: "80%",
    marginRight: "-50%",
    transform: "translate(-50%, -50%)",
  },
};

export default function EditModal(props) {
  const [maphivanchuyen, setMaphivanchuyen] = useState(0);
  const [khoangcachmin, setKhoangcachmin] = useState(0);
  const [khoangcachmax, setKhoangcachmax] = useState(0);
  const [chiphi, setChiphi] = useState(0);

  useEffect(() => {
    setMaphivanchuyen(props.costItem.maphivanchuyen);
    setKhoangcachmin(props.costItem.khoangcachmin);
    setKhoangcachmax(props.costItem.khoangcachmax);
    setChiphi(props.costItem.chiphi);
  }, [props.costItem]);

  function submitHandler() {
    if (khoangcachmin < 0 || isNaN(khoangcachmin)) {
      myToast.toastError("khoảng cách min không hợp lệ");
      return;
    }
    if (khoangcachmax < 0 || isNaN(khoangcachmax)) {
      myToast.toastError("khoảng cách max không hợp lệ");
      return;
    }
    if (chiphi < 0 || isNaN(chiphi)) {
      myToast.toastError("chi phí không hợp lệ");
      return;
    }

    DeliveryCostApi
      .editCostItem(maphivanchuyen, khoangcachmin, khoangcachmax, chiphi)
      .then((success) => {
        myToast.toastSucces("Sửa thành công");
        props.editFunction(success.data);
        props.closeModal();
      })
      .catch((error) => {
        myToast.toastError("Sửa thất bại");
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
              sửa giá vận chuyển
            </h5>
          </div>

          <div className="form-main-add-edit">
            <div className="row mb-1">
              <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                khoảng cách min
              </div>
              <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6 ">
                <input
                  className="form-control border "
                  id="khoangcachmin"
                  placeholder=""
                  onChange={(e) => setKhoangcachmin(e.target.value)}
                  value={khoangcachmin}
                ></input>
              </div>
            </div>

            <div className="row mb-1">
              <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6">Khoảng cách max</div>
              <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6 ">
                <input
                  className="form-control border"
                  id="khoangcachmax"
                  placeholder=""
                  onChange={(e) => setKhoangcachmax(e.target.value)}
                  value={khoangcachmax}
                ></input>
              </div>
            </div>

            <div className="row mb-1">
              <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                phí vận chuyển
              </div>
              <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6 ">
                <input
                  className="form-control border"
                  id="chiphi"
                  placeholder=""
                  onChange={(e) => setChiphi(e.target.value)}
                  value={chiphi}
                ></input>
              </div>
            </div>
          </div>

          <hr></hr>

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
              Sửa
            </button>
          </div>
        </div>
      </div>
    </Modal>
  );
}
