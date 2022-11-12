import React, { useState } from "react";
import "reactjs-popup/dist/index.css";
import Modal from "react-modal";
import * as productApi from "../../apis/product";
import * as myToast from "../../../Common/helper/toastHelper";
import "./style.css";
import FindTrademarkModal from "./FindTrademarkModal";
import Cookies from "universal-cookie";

const cookie = new Cookies();

const customStyles = {
  content: {
    top: "50%",
    left: "50%",
    right: "auto",
    bottom: "auto",
    marginRight: "-50%",
    height : "80%",
    transform: "translate(-50%, -50%)",
  },
};

export default function AddModal(props) {
  const [tensanpham, setTensanpham] = useState("");
  const [maloai, setMaloai] = useState(1);
  const [mathuonghieu, setMathuonghieu] = useState();
  const [mota, setMota] = useState("");
  const [image, setImage] = useState();
  const [thoidiemramat, setThoidiemramat] = useState(new Date());
  const [dongia, setDongia] = useState();
  const [thoigianbaohanh, setThoigianbaohanh] = useState();
  const [progress, setProgress] = useState(0);
  const [showModal, setShowModal] = useState(0);
  const [thongsokithuat, setThongsokithuat] = useState([]);

  const submitHandler = async () => {
    if(dongia < 0 || isNaN(dongia)){
      myToast.toastError("Đơn giá không hợp lệ");
      return;
    }
    setProgress(0);
    const fd = new FormData();
    fd.append("tensanpham", tensanpham);
    fd.append("maloai", maloai);

    fd.append("mathuonghieu", mathuonghieu);
    fd.append("mota", mota);
    fd.append("image", image);
    fd.append(
      "thoidiemramat",
      new Date(thoidiemramat).toISOString().split("T")[0]
    );
    fd.append("dongia", dongia);
    fd.append("thongsokithuat", thongsokithuat);
    fd.append("thoigianbaohanh", thoigianbaohanh);

    var token = cookie.get("token");
    var refreshtoken = cookie.get("refreshtoken");
    await productApi
      .addProduct(fd, setProgress, token, refreshtoken)
      .then(async (success) => {
        if (success.status === 200) {
          token = cookie.get("token");
          refreshtoken = cookie.get("refreshtoken");
          await productApi
            .addSpecification(
              success.data.value.masanpham,
              thongsokithuat,
              token,
              refreshtoken
            )
            .then((success2) => {
              if (success2.status === 200) {
                props.addProduct(success.data.value);
                props.closeModal();
                myToast.toastSucces("Thêm mới thành công");
              }
            })
            .catch((error2) => {
              console.error(error2);
            });
        }
      })
      .catch((error) => {
        myToast.toastError("Thêm mới thất bại");
        console.error(error);
      });
  };

  function chooseFunction(trademark) {
    setMathuonghieu(trademark.mathuonghieu);
  }

  function themthongsokithuat() {
    let newchitiet = thongsokithuat;
    newchitiet.push({ ten: "", noidung: "" });
    setThongsokithuat([...newchitiet]);
  }

  return (
    <Modal
      isOpen={props.showModal}
      onRequestClose={props.closeModal}
      style={customStyles}
      contentLabel="Example Modal"
    
    >
      <FindTrademarkModal
        showModal={showModal}
        closeModal={() => setShowModal(false)}
        chooseFunction={chooseFunction}
      ></FindTrademarkModal>
      <div className="add-product-item-modal" role="document">
        <div className="">
          <div className="modal-header">
            <h5 className="modal-title" id="exampleModalLongTitle">
              Thêm mới sản phẩm
            </h5>
          </div>

          <div className="row group-sanpham-quanly">
            <div className="form-main-add-edit col-xs-7 col-sm-7 col-md-7 col-lg-7 px-4">
              <div className="row mb-3 ">
                <span className="text-secondary text-xs font-weight-bold">
                  <img
                    alt=""
                    style={{ width: "80px", height: "80px" }}
                    src={image !== undefined ? URL.createObjectURL(image) : ""}
                  ></img>
                </span>
              </div>

              <div className="row mb-1">
                <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                  Tên sản phẩm
                </div>
                <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6 ">
                  <input
                    className="form-control border "
                    id="tensanpham"
                    placeholder=""
                    onChange={(e) => {
                      setTensanpham(e.target.value);
                    }}
                    value={tensanpham}
                  ></input>
                </div>
              </div>

              <div className="row mb-1">
                <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                  Loại sản phẩm
                </div>
                <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6 ">
                  <select
                    className="form-control border"
                    id="maloai"
                    name="maloai"
                    placeholder=""
                    onChange={(e) => {
                      setMaloai(e.target.value);
                    }}
                    value={maloai}
                  >
                    <option value="1">Điện thoại</option>
                    <option value="2">Laptop</option>
                  </select>
                </div>
              </div>

              <div className="row mb-1">
                <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                  Mã thương hiệu
                </div>
                <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6 ">
                  <input
                    className="form-control border"
                    id="mathuonghieu"
                    placeholder=""
                    onChange={(e) => {
                      setMathuonghieu(e.target.value);
                    }}
                    value={mathuonghieu}
                  ></input>
                  <div className="mr-1" onClick={() => setShowModal(true)}>
                    <div onClick={() => setShowModal(true)}>
                      <i class="bi bi-arrow-right-circle "></i>
                    </div>
                  </div>
                </div>
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
                  Thời điểm ra mắt
                </div>
                <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6 ">
                  <input
                    className="form-control border"
                    type="date"
                    id="ngayhoadon"
                    name="trip-start"
                    onChange={(e) => {
                      setThoidiemramat(new Date(e.target.value));
                    }}
                    value={thoidiemramat.toISOString().split("T")[0]}
                  ></input>
                </div>
              </div>

              <div className="row mb-1">
                <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                  Đơn giá
                </div>
                <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6 ">
                  <input
                    className="form-control border"
                    id="dongia"
                    placeholder=""
                    onChange={(e) => {
                      setDongia(e.target.value);
                    }}
                    value={dongia}
                  ></input>
                </div>
              </div>

              <div className="row mb-1">
                <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                  Thời gian bảo hành
                </div>
                <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6 ">
                  <input
                    className="form-control border"
                    id="thoigianbaohanh"
                    placeholder=""
                    onChange={(e) => {
                      setThoigianbaohanh(e.target.value);
                    }}
                    value={thoigianbaohanh}
                  ></input>
                </div>
              </div>

              <div className="row mb-1">
                <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6">Mô tả</div>
              </div>
              <div className="row mb-1">
                <textarea
                  class="form-control border"
                  id="mota"
                  rows="30"
                  onChange={(e) => {
                    setMota(e.target.value);
                  }}
                  value={mota}
                ></textarea>
              </div>
            </div>

            <div className="form-main-add-edit2 col-xs-5 col-sm-5 col-md-5 col-lg-5">
              <div className="row mb-3 ">
                <span className="text-secondary text-xs font-weight-bold pb-5">
                  <h5>Thông số kĩ thuật</h5>
                </span>
              </div>
              {thongsokithuat.map((value, key) => {
                return (
                  <div>
                    <div className="row mb-1">
                      <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        Tên thông số
                      </div>
                      <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6 ">
                        <input
                          className="form-control border"
                          id="ten"
                          name="ten"
                          placeholder
                          onChange={((i, e) => {
                            let temp = [...thongsokithuat];
                            temp[i].ten = e.target.value;
                            setThongsokithuat(temp);
                          }).bind(this, key)}
                          value={value.ten}
                        />
                      </div>
                    </div>
                    <div className="row mb-1">
                      <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        Nội dung
                      </div>
                      <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6 ">
                        <input
                          className="form-control border"
                          id="noidung"
                          name="noidung"
                          placeholder
                          onChange={((i, e) => {
                            let temp = [...thongsokithuat];
                            temp[i].noidung = e.target.value;
                            setThongsokithuat(temp);
                          }).bind(this, key)}
                          value={value.noidung}
                        />
                      </div>
                    </div>
                    <hr />
                  </div>
                );
              })}
              <div className="row mb-1">
                <button className="btn btn-info" onClick={themthongsokithuat}>
                  Thêm thông số kỹ thuật
                </button>
              </div>
            </div>
          </div>

          <hr></hr>

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
