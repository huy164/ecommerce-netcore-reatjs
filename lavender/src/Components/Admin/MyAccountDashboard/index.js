import React, { useState, useEffect } from "react";
import "./style.css";
import Cookies from "universal-cookie/es6";
import * as loginAct from "../../redux/actions/loginAct";
import { useSelector, useDispatch } from "react-redux";
import { Redirect } from "react-router-dom";
import * as imageApi from "../../apis/image";
import * as staffApi from "../../apis/staff";
import * as staffAccountApi from "../../apis/staffaccount";
import LoadingContainer from "../../../Common/helper/loading/LoadingContainer";
import * as myToast from "../../../Common/helper/toastHelper";

const cookie = new Cookies();

function Index(props) {
  const [hovaten, setHovaten] = useState("");
  const [email, setEmail] = useState("");
  const [sodienthoai, setSodienthoai] = useState("");
  const [diachi, setDiachi] = useState("");
  const [ngayvaolam, setNgayvaolam] = useState(new Date());
  const [cccd, setCccd] = useState("");
  const [ngaysinh, setNgaysinh] = useState(new Date());
  const [chucvu, setChucvu] = useState("");
  const [password, setPassword] = useState("");
  const [newpassword, setNewpassword] = useState("");
  const [repeatnewpassword, setRepeatnewpassword] = useState("");
  const [doimatkhau, setDoimatkhau] = useState(false);
  const [tendangnhap, setTendangnhap] = useState("");
  const [image, setImage] = useState();
  const [loading, setLoading] = useState(true);
  const [imageView, setImageView] = useState();
  const [progress, setProgress] = useState(0);
  const manhanvien = useSelector((state) => state.login.manhanvien);
  const dispatch = useDispatch();
  const logout = async () => {
    dispatch(
      await loginAct.postLogoutReport(
        manhanvien,
        "nhanvien",
        cookie.get("token"),
        cookie.get("refreshtoken")
      )
    );
  };
  useEffect(() => {
    (async () => {
      await staffApi
        .timNhanvienBangManhanvien(
          manhanvien,
          cookie.get("token"),
          cookie.get("refreshtoken")
        )
        .then((success) => {
          if (success.status === 200) {
            setHovaten(success.data.value.tennhanvien);
            setSodienthoai(success.data.value.sodienthoai);
            setEmail(success.data.value.email);
            setNgayvaolam(new Date(success.data.value.ngayvaolam));
            setCccd(success.data.value.cccd);
            setNgaysinh(new Date(success.data.value.ngaysinh));
            setChucvu(success.data.value.chucvu);
            setImage(success.data.value.image);
            setDiachi(success.data.value.diachi);
          }
        })
        .catch((error) => {
          console.error(error);
        });

      setLoading(false);
    })();
  }, [manhanvien]);

  function submitHandler() {
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
    myToast.toastLoading();
    const fd = new FormData();
    fd.append("manhanvien", manhanvien);
    fd.append("tennhanvien", hovaten);
    fd.append("email", email);
    fd.append("diachi", diachi);
    fd.append("ngayvaolam", new Date(ngayvaolam).toISOString().split("T")[0]);
    fd.append("cccd", cccd);
    fd.append("ngaysinh", new Date(ngaysinh).toISOString().split("T")[0]);
    if (imageView!==undefined) fd.append("image", image);
    fd.append("sodienthoai", sodienthoai);
    fd.append("chucvu", chucvu);

    var token = cookie.get("token");
    var refreshtoken = cookie.get("refreshtoken");
    staffApi
      .editStaff(fd, runProgress, token, refreshtoken)
      .then((success) => {
        if (success.status === 200) {
          myToast.toastSucces("Sửa thành công");
        }
      })
      .catch((error) => {
        myToast.toastError("Sửa thông tin thất bại");
        console.error(error);
      });
  }

  function changePassword() {
    myToast.toastLoading();
    const fd = new FormData();
    fd.append("manhanvien", manhanvien);
    fd.append("username", tendangnhap);
    fd.append("password", password);
    fd.append("newpassword", newpassword);
    var token = cookie.get("token");
    var refreshtoken = cookie.get("refreshtoken");
    staffAccountApi
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
  const runProgress = (percent) => {
    setProgress(percent);
  };

  return (
    <main className="main-content position-relative border-radius-lg left-menu">
      <LoadingContainer loading={loading}></LoadingContainer>

      {manhanvien === undefined && <Redirect to="/login"></Redirect>}
      <div className="container rounded bg-white mt-5 mb-5">
        <div className="row">
          <div className="col-md-3 border-right">
            <div className="d-flex flex-column align-items-center text-center p-3 py-5">
              <img
                alt="img-profile"
                className="rounded-circle mt-5"
                width="150px"
                src={
                  imageView === undefined
                    ? imageApi.image(image, manhanvien)
                    : URL.createObjectURL(imageView)
                }
              />

              <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6 ">
                <input
                  className="form-control border"
                  type="file"
                  placeholder=""
                  onChange={(e) => setImageView(e.target.files[0])}
                ></input>
              </div>

              <span className="font-weight-bold">{manhanvien}</span>
              <span className="text-black-50">{hovaten}</span>
              <span> </span>
            </div>
            <button
              className="btn btn-warning text-white d-block w-100"
              onClick={logout}
            >
              <i class="fas fa-sign-out-alt mx-2 "></i>
              Đăng xuất
            </button>
          </div>
          <div className="col-md-5 border-right">
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
                    value={hovaten}
                    onChange={(e) => setHovaten(e.target.value)}
                  />
                </div>
                <div className="col-md-6">
                  <label className="labels">Số điện thoại</label>
                  <input
                    type="tel"
                    className="form-control border"
                    defaultValue
                    value={sodienthoai}
                    onChange={(e) => setSodienthoai(e.target.value)}
                  />
                </div>
              </div>
              <div className="row mt-3">
                <div className="col-md-12">
                  <label className="labels">Email</label>
                  <input
                    type="email"
                    className="form-control border"
                    defaultValue
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                  />
                </div>
                <div className="col-md-12">
                  <label className="labels">Ngày vào làm</label>
                  <input
                    type="date"
                    className="form-control border"
                    defaultValue
                    onChange={(e) => setNgayvaolam(new Date(e.target.value))}
                    value={ngayvaolam.toISOString().split("T")[0]}
                  />
                </div>
                <div className="col-md-12">
                  <label className="labels">CCCD</label>
                  <input
                    type="number"
                    className="form-control border"
                    defaultValue
                    value={cccd}
                    onChange={(e) => setCccd(e.target.value)}
                  />
                </div>
                <div className="col-md-12">
                  <label className="labels">Ngày sinh</label>
                  <input
                    type="date"
                    className="form-control border"
                    defaultValue
                    onChange={(e) => setNgaysinh(new Date(e.target.value))}
                    value={ngaysinh.toISOString().split("T")[0]}
                  />
                </div>
                <div className="col-md-12">
                  <label className="labels">Chức vụ</label>
                  <input
                    type="text"
                    className="form-control"
                    disabled
                    value={chucvu}
                    defaultValue
                  />
                </div>
              </div>
              <div className="mt-5 text-center">
                <button
                  className="btn btn-primary profile-button"
                  type="button"
                  onClick={submitHandler}
                >
                  Lưu thay đổi
                </button>
              </div>
            </div>
          </div>
          <div className="col-md-4">
            <div className="p-3 py-5">
              <div className="d-flex justify-content-between align-items-center ">
                <span>Tài khoản</span>
                <span
                  className="border rounded px-3 p-1 add-"
                  onClick={() => setDoimatkhau(!doimatkhau)}
                  style={{ cursor: "pointer" }}
                >
                  <i class="fas fa-edit"></i>
                  &nbsp;Đổi mật khẩu
                </span>
              </div>
              <br />

              {doimatkhau && (
                <>
                  <br />
                  <div className="col-md-12">
                    <label className="labels">Tên đăng nhập</label>
                    <input
                      type="text"
                      className="form-control border"
                      placeholder=""
                      defaultValue
                      value={tendangnhap}
                      onChange={(e) => setTendangnhap(e.target.value)}
                    />
                  </div>
                  <div className="col-md-12">
                    <label className="labels">Mật khẩu</label>
                    <input
                      type="password"
                      className="form-control border"
                      placeholder=""
                      defaultValue
                      value={password}
                      onChange={(e) => setPassword(e.target.value)}
                    ></input>
                  </div>

                  <div className="col-md-12">
                    <label className="labels">Mật khẩu mới</label>
                    <input
                      type="password"
                      className="form-control border"
                      placeholder=""
                      defaultValue
                      value={newpassword}
                      onChange={(e) => setNewpassword(e.target.value)}
                    ></input>
                  </div>
                  <div className="col-md-12">
                    <label className="labels">Nhập lại mật khẩu</label>

                    <input
                      type="password"
                      className="form-control border"
                      placeholder=""
                      defaultValue
                      value={repeatnewpassword}
                      onChange={(e) => {
                        setRepeatnewpassword(e.target.value);
                      }}
                    ></input>
                    {newpassword !== repeatnewpassword && (
                      <label className="labels mx-1 row text-danger">
                        Mật khẩu không khớp
                      </label>
                    )}
                  </div>
                  <div className=" text-center">
                    {" "}
                    <button
                      className="btn btn-info mt-4"
                      onClick={changePassword}
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
    </main>
  );
}
export default Index;
