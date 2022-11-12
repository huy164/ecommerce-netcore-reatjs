import React, { useEffect, useState } from "react";
// import * as productApi from "../apis/product";
import * as customerApi from "../apis/customer";
import Cookies from "universal-cookie";
import AddModal from "./AddModal";
import DeleteModal from "./DeleteModal";
// import * as detailBillApi from "../apis/detailBill";
import { numberWithCommas } from "../../Common/helper/numberHelper";

const cookie = new Cookies();

export default function ProcessingBill(props) {
  const [customer, setCustomer] = useState();
  const [showModal, setShowModal] = useState(0);
  function closeModal() {
    setShowModal(0);
  }
  function openAddModal() {
    setShowModal(1);
  }
  function openDeleteModal() {
    setShowModal(2);
  }
  useEffect(() => {
    (async () => {
      var token = cookie.get("token");
      var refreshtoken = cookie.get("refreshtoken");
      customerApi
        .findCustomerByBillId(props.bill.sohoadon, token, refreshtoken)
        .then((success) => {
          if (success.status === 200) {
            setCustomer(success.data.value);
          }
        })
        .catch((error) => {
          console.error(error);
        });
    })();
  }, [props.bill]);

  return (
    <>
      <AddModal
        showModal={showModal === 1 && true}
        closeModal={closeModal}
        bill={props.bill}
        customer={customer}
        addFunction={props.reloadFunction}
      ></AddModal>
      <DeleteModal
        showModal={showModal === 2 && true}
        bill={props.bill}
        closeModal={closeModal}
        deleteFunction={props.reloadFunction}
      ></DeleteModal>
      <div className="timeline-block mb-3">
        <span className="timeline-step text-warning ">
          <i class="bi bi-bell"></i>
        </span>
        <div className="timeline-content">
          <h6 className="text-dark text-sm font-weight-bold mb-0">
            Số hoá đơn: {props.bill.sohoadon}
          </h6>
          <h6 className="text-success text-sm font-weight-bolder">
            Tổng tiền: {numberWithCommas(props.bill.tongtien)} đ
          </h6>
          <h6 className="text-success text-sm font-weight-bolder">
            {(customer !== undefined) & (customer !== null) &&
              customer.tenkhachhang}
            ,{" "}
            {(customer !== undefined) & (customer !== null) &&
              customer.sodienthoai}
          </h6>
          <p className="text-secondary font-weight-bold text-xs mt-1 mb-0">
            {props.bill.ngayhoadon}
          </p>
          <div
            className="btn btn-link text-warning px-3 mb-0 btn-xulidonhang"
            onClick={openAddModal}
          >
            <i class="fad fa-angle-right"></i> Tiếp nhận
          </div>
          <div
            className="btn btn-link text-danger px-3 mb-0 btn-tuchoidonhang"
            onClick={openDeleteModal}
          >
            <i class="fas fa-eject"></i> Từ chối
          </div>
        </div>
      </div>
    </>
  );
}
