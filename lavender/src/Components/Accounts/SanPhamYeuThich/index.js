import React, { useEffect, useState } from "react";
import { useSelector} from "react-redux"
import "./SanPhamYeuThich.css";
import * as favoriteApi from "../../apis/favorite";
import SanphamItem from "./SanphamItem";

export default function Index(props) {
  const [listyeuthich, setListyeuthich] = useState([]);
  const makhachhang = useSelector((state) => state.login.makhachhang);
  useEffect(() => {
    loadDanhsach();
  }, [makhachhang]);

  async function loadDanhsach() {
    await favoriteApi
      .favorite(makhachhang)
      .then((success) => {
        setListyeuthich(success.data.value.$values);
      })
      .catch((error) => {
        console.error(error);
      });
  }
  async function deleteYeuthich() {
    await loadDanhsach();
  }
  return (
    <div className="Account__StyledAccountLayoutInner-sc-1d5h8iz-1 jXurFV">
      <div className="styles__StyledAccountWishList-sc-11qh9gl-0 kagiDG">
        <div className="heading">Danh sách yêu thích</div>
        <div className="inner">
          <ul className="list">
            {listyeuthich.map((value, key) => {
              return (
                <SanphamItem
                  key={key}
                  loadDanhsach={loadDanhsach}
                  masanpham={value.masanpham}
                  makhachhang = {makhachhang}
                  deleteYeuthich={deleteYeuthich}
                ></SanphamItem>
              );
            })}
          </ul>
        </div>
      </div>
    </div>
  );
}
