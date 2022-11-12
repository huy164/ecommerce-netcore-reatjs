import React, { useEffect, useState } from "react";
import "reactjs-popup/dist/index.css";
import Modal from "react-modal";
import * as staffApi from "../../apis/staff";
import * as myToast from "../../../Common/helper/toastHelper";
import * as imageApi from "../../apis/image";
import Cookies from "universal-cookie";

const cookie = new Cookies();

const customStyles = {
  content: {
    top: "50%",
    height : "80%",
    left: "50%",
    right: "auto",
    bottom: "auto",
    marginRight: "-50%",
    transform: "translate(-50%, -50%)",
  },
};

export default function EditModal(props) {
  const [tennhanvien, setTennhanvien] = useState(props.staff.tennhanvien);
  const [email, setEmail] = useState(props.staff.email);
  const [sodienthoai, setSodienthoai] = useState(props.staff.sodienthoai);
  const [diachi, setDiachi] = useState(props.staff.diachi);
  const [ngayvaolam, setNgayvaolam] = useState(new Date(props.staff.ngayvaolam));
  const [cccd, setCccd] = useState(props.staff.cccd);
  const [ngaysinh, setNgaysinh] = useState(new Date(props.staff.ngaysinh));
  const [progress, setProgress] = useState(0);
  const [chucvu, setChucvu] = useState(props.staff.chucvu);
  const [image, setImage] = useState();

  useEffect(() => {
    setTennhanvien(props.staff.tennhanvien);
    setEmail(props.staff.email);
    setSodienthoai(props.staff.sodienthoai);
    setDiachi(props.staff.diachi);
    setNgayvaolam(new Date(props.staff.ngayvaolam));
    setCccd(props.staff.cccd);
    setNgaysinh(props.staff.ngaysinh);
    setChucvu(props.staff.chucvu);
  }, [props.staff]);
  const submitHandler = () => {
    if(sodienthoai < 0 || isNaN(sodienthoai)){
      myToast.toastError("Số điện thoại không hợp lệ");
      return;
    }
    if(cccd < 0 || isNaN(cccd)){
      myToast.toastError("CCCD không hợp lệ.");
      return;
    }
    
    if(ngaysinh.getFullYear() > ngayvaolam.getFullYear() || (ngayvaolam.getFullYear() - ngaysinh.getFullYear())<18){
      myToast.toastError("Ngày vào làm không hợp lệ.");
      return;
    }
    const fd = new FormData();
    fd.append("manhanvien", props.staff.manhanvien);
    fd.append("tennhanvien", tennhanvien);
    fd.append("email", email);
    fd.append("sodienthoai", sodienthoai);
    fd.append("diachi", diachi);
    fd.append("ngayvaolam", new Date(ngayvaolam));
    fd.append("cccd", cccd);
    fd.append("ngaysinh", new Date(ngaysinh));
    fd.append("image", image);
    fd.append("chucvu", chucvu);

    var token = cookie.get("token");
    var refreshtoken = cookie.get("refreshtoken");

    staffApi
      .editStaff(fd, setProgress.bind(this, token, refreshtoken))
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
      {console.log(props.staff)}
      <div class="add-item-modal" role="document">
        <div class="">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle">
              Sửa nhân viên
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
                      : imageApi.image(props.staff.image, props.staff.manhanvien)
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
                Tên nhân viên
              </div>
              <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6 ">
                <input
                  className="form-control border "
                  id="tennhanvien"
                  placeholder=""
                  onChange={(e) => {
                    setTennhanvien(e.target.value);
                  }}
                  value={tennhanvien}
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

            <div className="row mb-1">
              <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                Ngày vào làm
              </div>
              <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6 ">
                <input
                  className="form-control border"
                  type="date"
                  id="ngayvaolam"
                  name="trip-start"
                  onChange={(e) => setNgayvaolam(new Date(e.target.value))}
                  value={ngayvaolam}
                ></input>
              </div>
            </div>

            <div className="row mb-1">
              <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6">CCCD</div>
              <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6 ">
                <input
                  className="form-control border"
                  id="cccd"
                  placeholder=""
                  onChange={(e) => {
                    setCccd(e.target.value);
                  }}
                  value={cccd}
                ></input>
              </div>
            </div>

            <div className="row mb-1">
              <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                Ngày sinh
              </div>
              <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6 ">
                <input
                  className="form-control border"
                  type="date"
                  id="ngaysinh"
                  name="trip-start"
                  onChange={(e) => setNgaysinh(new Date(e.target.value))}
                  value={ngaysinh}
                ></input>
              </div>
            </div>

            <div className="row mb-1">
              <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6">Chức vụ</div>
              <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6 ">
                <input
                  className="form-control border"
                  id="chucvu"
                  placeholder=""
                  onChange={(e) => {
                    setChucvu(e.target.value);
                  }}
                  value={chucvu}
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
              Thêm
            </button>
          </div>
        </div>
      </div>
    </Modal>
  );
}
