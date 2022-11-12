import React, { useState } from "react";
import * as imageApi from "../../apis/image";
import { Link } from "react-router-dom";
import DanhgiaModal from "./DanhgiaModal";
import { numberWithCommas } from '../../../Common/helper/numberHelper';
export default function ItemDagiao(props) {
  const [showModal, setShowModal] = useState(false);
  const [item,setItem] = useState(props.product);
  function closeModal() {
    setShowModal(false);
  }
  function openModal() {
    setShowModal(true);
  }

  return (
    <div>
      <DanhgiaModal
        showModal={showModal}
        closeModal={closeModal}
        masanpham={item.masanpham}
        makhachhang={props.makhachhang}
        sohoadon={item.sohoadon}
        imei={item.imei}
      ></DanhgiaModal>
      <div>
      <div className="_2lVoQ1">
          <div className="_1limL3">
            <div>
              <span className="_1BJEKe">
                <div />
                <div className="_3huAcN">
                  <div className="_3btL3m">
                    <div className="shopee-image__wrapper">
                      <img
                        alt="anhthunho"
                        className="shopee-image__content"
                        src={imageApi.image(item.image)}
                      ></img>
                    </div>
                  </div>
                  <div className="_1cxKtp">
                    <div>
                      <div className="_1xHDVY">
                        <span className="_30COVM text-info">
                          {item.tensanpham}
                        </span>
                      </div>
                      <div className="_1xHDVY">
                        <span className="_30COVM  small">
                          imei: {item.imei}
                        </span>
                      </div>
                      <div className="_1kvNGb text-secondary">
                        <div>
                          <span className="">{item.mausac} - {item.dungluong}</span>
                        </div>
                      </div>
                      <div className="_1kvNGb text-warning">
                        <div>
                          Đơn giá:{" "}
                          <span >{numberWithCommas(item.giamoi)}₫</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </span>
            </div>
            <div className="_3tEHtP" />
          </div>
        </div>
      </div>
      <div className="_1J7vLy">
        <div className="DI-rNr tyOBoQ"> </div>
        <div className="DI-rNr _25igL4"> </div>
        {props.product.dadanhgia === 0 ? <button className="btn btn-primary danhgia-btn" onClick={openModal}>Đánh giá</button> :
          <button className="btn btn-light danhgia-btn" disabled >Đã đánh giá</button>}
      </div>
      <hr></hr>
    </div>
  );
}
