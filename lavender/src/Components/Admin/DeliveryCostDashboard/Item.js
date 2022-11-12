import React, { useState } from "react";
import EditModal from "./EditModal";
import DeleteModal from "./DeleteModal";

export default function Item(props) {
  const [showModal, setShowModal] = useState(0);
  function closeModal() {
    setShowModal(0);
  }
  return (
    <tr>
      <EditModal
        showModal={showModal === 1 && true}
        closeModal={closeModal}
        costItem={props.costItem}
        editFunction={props.editFunction}
      ></EditModal>
      <DeleteModal
        showModal={showModal === 2 && true}
        costItem={props.costItem}
        closeModal={closeModal}
        deleteFunction={props.deleteFunction}
      ></DeleteModal>

      <td className="align-left ">
        từ {props.costItem.khoangcachmin}km {props.costItem.khoangcachmax==100000?'trở lên':" đến "+ props.costItem.khoangcachmax+'km'}
      </td>
      <td className="align-left">
        <span className="text-secondary text-xs font-weight-bold">
          {props.costItem.chiphi}đ
        </span>
      </td>    
      <td className="align-middle">
        <div
          className="btn btn-link text-dark px-3 mb-0"
          onClick={() => setShowModal(1)}
        >
          <i class="bi bi-pencil-square"></i>
          {"  "}Sửa
        </div>
        <div
          className="btn btn-link text-danger px-3 mb-0 "
          style={{ position: "relative", zIndex: "0" }}
          onClick={() => setShowModal(2)}
        >
          <i class="bi bi-trash"></i>
          {"  "}Xoá
        </div>
      </td>
    </tr>
  );
}
