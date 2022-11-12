import React, { useEffect, useState } from "react";
import "reactjs-popup/dist/index.css";
import Modal from "react-modal";
import * as suplierApi from "../../apis/suplier";
import * as myToast from "../../../Common/helper/toastHelper";
import * as imageApi from "../../apis/image";
import Cookies from "universal-cookie";

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

export default function EditModal(props) {
  const [tennhacungcap, setTennhacungcap] = useState("");
  const [email, setEmail] = useState("");
  const [sodienthoai, setSodienthoai] = useState("");
  const [diachi, setDiachi] = useState("");
  const [progress, setProgress] = useState(0);
  const [image, setImage] = useState();

  useEffect(() => {
    setTennhacungcap(props.suplier.tennhacungcap);
    setEmail(props.suplier.email);
    setSodienthoai(props.suplier.sodienthoai);
    setDiachi(props.suplier.diachi);
  }, [props.suplier]);

  const submitHandler = () => {
    if(sodienthoai < 0 || isNaN(sodienthoai)){
      myToast.toastError("Số điện thoại không hợp lệ");
      return;
    }
    const fd = new FormData();
    fd.append("manhacungcap", props.suplier.manhacungcap);
    fd.append("tennhacungcap", tennhacungcap);
    fd.append("email", email);
    fd.append("sodienthoai", sodienthoai);
    fd.append("diachi", diachi);
    fd.append("image", image);

    var token = cookie.get("token");
    var refreshtoken = cookie.get("refreshtoken");
    suplierApi
      .editSuplier(fd, setProgress, token, refreshtoken)
      .then((success) => {
        props.edit(success.data.value);
        props.closeModal();
      })
      .catch((error) => {
        myToast.toastError("Thêm mới thất bại");
        console.error(error);
      });
  };
  return (
    <Modal
      isOpen={props.showModal}
      onRequestClose={props.closeModal}
      style={customStyles}
      contentLabel="Example Modal"
    >
      <div class="nhacungcapmodal add-item-modal" role="document">
        <div class="">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle">
              Sửa nhà cung cấp
            </h5>
          </div>

          <hr></hr>

          <div className="form-main-add-edit">
            <div className="row mb-3">
              <span className="text-secondary text-xs font-weight-bold">
                <img
                  alt=""
                  style={{ width: "80px", height: "80px" }}
                  src={
                    image !== undefined
                      ? URL.createObjectURL(image)
                      : imageApi.image(
                          props.suplier.image,
                          props.suplier.manhacungcap
                        )
                  }
                ></img>
              </span>
            </div>
            <div className="row mb-1">
              <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6">Image</div>
              <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6 ">
                <input
                  className="form-control border"
                  id="image"
                  type="file"
                  placeholder=""
                  onChange={(e) => {
                    setImage(e.target.files[0]);
                  }}
                ></input>
              </div>
            </div>
            <div className="row mb-1">
              <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                Tên nhà cung cấp
              </div>
              <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6 ">
                <input
                  className="form-control border "
                  id="tennhacungcap"
                  placeholder=""
                  onChange={(e) => {
                    setTennhacungcap(e.target.value);
                  }}
                  value={tennhacungcap}
                ></input>
              </div>
            </div>

            <div className="row mb-1">
              <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6">Email</div>
              <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6 ">
                <input
                  className="form-control border"
                  id="email"
                  type="email"
                  placeholder=""
                  onChange={(e) => {
                    setEmail(e.target.value);
                  }}
                  value={email}
                ></input>
              </div>
            </div>

            <div className="row mb-1">
              <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                Số điện thoại
              </div>
              <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6 ">
                <input
                  className="form-control border"
                  id="sodienthoai"
                  type="tel"
                  placeholder=""
                  onChange={(e) => {
                    setSodienthoai(e.target.value);
                  }}
                  value={sodienthoai}
                ></input>
              </div>
            </div>

            <div className="row mb-1">
              <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6">Địa chỉ</div>
              <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6 ">
                <input
                  className="form-control border"
                  id="diachi"
                  placeholder=""
                  onChange={(e) => {
                    setDiachi(e.target.value);
                  }}
                  value={diachi}
                ></input>
              </div>
            </div>
          </div>

          <div className="progress">
            <div
              className="progress-bar"
              role="progressbar"
              style={{ width: progress + "%" }}
            ></div>
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
              Sửa
            </button>
          </div>
        </div>
      </div>
    </Modal>
  );
}
