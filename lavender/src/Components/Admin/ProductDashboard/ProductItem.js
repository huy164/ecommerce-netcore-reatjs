import React, { useState, useEffect } from "react";
import * as imageApi from "../../apis/image";
import * as detailProductApi from "../../apis/detailProduct";
import EditModal from "./EditModal";
import DeleteModal from "./DeleteModal";

export default function ProductItem(props) {
  const [giamoi, setGiamoi] = useState(0);
  const [showModal, setShowModal] = useState();
  useEffect(() => {
    detailProductApi
      .xemgiamoitheomasanpham(props.product.masanpham)
      .then((success) => {
        setGiamoi(success.data.value);
      })
      .catch((error) => {
        console.error(error);
      });
  }, [props.product]);

  function closeModal() {
    setShowModal(0);
  }
  return (
    <tr>
      <EditModal
        showModal={showModal === 1 && true}
        closeModal={closeModal}
        product={props.product}
        editProduct={props.editProduct}
      ></EditModal>
      <DeleteModal
        showModal={showModal === 2 && true}
        product={props.product}
        closeModal={closeModal}
        deleteProduct={props.deleteProduct}
      ></DeleteModal>

      <td className="align-middle text-center">
        <span className="text-secondary text-xs font-weight-bold">
        {props.product.tensanpham}
        </span>
      </td>
      <td className="align-middle text-center">
        <span className="text-secondary text-xs font-weight-bold">
          <img
            alt="img"
            style={{ width: "80px", height: "80px" }}
            src={imageApi.image(props.product.image)}
          ></img>
        </span>
      </td>
      <td className="align-middle text-center">
        <span className="text-secondary text-xs font-weight-bold">
          {props.product.maloai}
        </span>
      </td>
      <td className="align-middle text-center">
        <span className="text-secondary text-xs font-weight-bold">
          {props.product.mathuonghieu}
        </span>
      </td>
      {/* <td className="align-middle text-center">
        <span className="text-secondary text-xs font-weight-bold">
          {props.product.soluongton}
        </span>
      </td> */}
      <td className="align-middle text-center">
        <span className="text-secondary text-xs font-weight-bold">
          {props.product.dongia}
        </span>
      </td>
      <td className="align-middle text-center">
        <span className="text-secondary text-xs font-weight-bold">
          {(() => {
            var dateObj = new Date(props.product.thoidiemramat);
            const day = String(dateObj.getDate()).padStart(2, "0");
            const month = dateObj.getMonth() + 1;
            const year = dateObj.getFullYear();
            const output = day + "/" + month + "/" + year;
            return output;
          })()}
        </span>
      </td>
      {giamoi === 0 ? (
        <td className="align-middle text-center text-sm">
          <span className="badge badge-sm bg-gradient-secondary">Hết hàng</span>
        </td>
      ) : (
        <td className="align-middle text-center text-sm">
          <span className="badge badge-sm bg-gradient-success">Còn hàng</span>
        </td>
      )}

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
