import React, { useState, useEffect } from "react";
import Modal from "react-modal";
import * as detailProductApi from "../../apis/detailProduct";
import Chitietsanpham from "./Chitietsanpham";
import * as billingApi from "../../apis/billing";
import Cookies from "universal-cookie";
import * as myToast from "../../../Common/helper/toastHelper";
import { numberWithCommas } from '../../../Common/helper/numberHelper';
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

export default function ItemDangxuly(props) {
  const [showModal, setShowModal] = useState(false);
  const [list, setList] = useState([]);

  const xoaHoahoadon = async () => {
    var token = cookie.get("token");
    var refreshtoken = cookie.get("refreshtoken");
    await billingApi
      .deleteBill(props.bill.sohoadon, token, refreshtoken)
      .then((success) => {
        if (success.status === 200) {
          myToast.toastSucces("Đã hủy đơn hàng");
          props.deleteFunction(props.bill.sohoadon)
        }
      })
      .catch((error) => {
        console.error(error);
        myToast.toastError("Không thể hủy đơn hàng");
      });
    setShowModal(false);
  };
  useEffect(() => {
    detailProductApi
      .timCacchitietsanphamBangSohoadon(props.bill.sohoadon)
      .then((success) => {
        if (success.status === 200) {
          setList(success.data.value.$values);
        }
      })
      .catch((error) => {
        console.error(error);
      });
  }, [props.bill]);
  return (
    <div className="border rounded">
      <Modal
        isOpen={showModal}
        onRequestClose={() => setShowModal(false)}
        style={customStyles}
        contentLabel="Example Modal"
      >
        Bạn có chắc chắn huỷ đơn hàng này không?
        <div class="modal-footer">
          <button
            type="button"
            class="btn btn-secondary"
            data-dismiss="modal"
            onClick={()=>setShowModal(false)}
          >
            Đóng
          </button>
          <button type="button" class="btn btn-primary" onClick={xoaHoahoadon}>
            Xoá
          </button>
        </div>
      </Modal>
      <div>
        <div className="GuWdvd">
          <div className="WqnWb-">
            <div className="_1DPpu5">
              {list.map((value, key) => {
                return (
                  <Chitietsanpham product={value} key={key}></Chitietsanpham>
                );
              })}
            </div>
          </div>
        </div>
      </div>
      <div>
        <hr></hr>
        <tr>
          <td>Ngày Đặt Hàng: {props.bill.ngayhoadon}</td>
          <td>Mã KM: {props.bill.makhuyenmai}</td>
          <td><strong>Thành tiền: {numberWithCommas(props.bill.tongtien)} đ</strong> </td>
        </tr>
      </div>
      <div className="_1J7vLy">
        <div className="DI-rNr tyOBoQ"> </div>
        <div className="DI-rNr _25igL4"> </div>
        <button
          className="btn btn-primary xoahoadon-btn"
          onClick={() => setShowModal(true)}
        >
          Hủy đơn hàng
        </button>
      </div>
    </div>
  );
}
