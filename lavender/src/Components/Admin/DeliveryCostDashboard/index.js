import React, { useState, useEffect } from "react";
import * as customerApi from "../../apis/customer";
import Item from "./Item";
import _ from "lodash";
import "./style.css";
import AddModal from "./AddModal";
import * as deliveryApi from "../../apis/delivery"
import LoadingContainer from "../../../Common/helper/loading/LoadingContainer";
import Cookies from "universal-cookie";

const cookie = new Cookies();

export default function DeliveryCostDashboard(props) {
  const [showModal, setShowModal] = useState(false);
  const [loading, setLoading] = useState(true);
  const [listDeliveryCost, setListDeliveryCost] = useState([]);
  function closeModal() {
    setShowModal(false);
  }
  function openModal() {
    setShowModal(true);
  }

  async function loadDeliveryCost() {
    setLoading(true);
    await deliveryApi
      .allDeliveryCost()
      .then((success) => {
        if (success.status === 200) {
            console.log("success"+success.data);
          setListDeliveryCost(success.data.value.$values);
        }
      })
      .catch((error) => {
        console.error(error);
      });
    setLoading(false);
  }

  useEffect(() => {
    // Update the document title using the browser API
    loadDeliveryCost();
  }, []);

  async function editFunction(costItem) {
    var listtemp = listDeliveryCost;
    _.remove(listtemp, (n) => {
      return n.maphivanchuyen === costItem.maphivanchuyen;
    });

    listtemp.push(costItem);

    await setListDeliveryCost([...listtemp]);
    // forceUpdate();
  }

  async function addFunction(costItem) {
    var listtemp = listDeliveryCost;
    listtemp.push(costItem);
    await setListDeliveryCost([...listtemp]);
  }

  async function deleteFunction(costItem) {
    var listtemp = listDeliveryCost;

    _.remove(listtemp, (n) => {
        return n.maphivanchuyen === costItem.maphivanchuyen;
    });
    await setListDeliveryCost([...listtemp]);
  }

  return (
    <main className="main-content position-relative border-radius-lg left-menu">
      <LoadingContainer loading={loading}></LoadingContainer>
      <AddModal
        showModal={showModal}
        closeModal={closeModal}
        addFunction={addFunction}
      ></AddModal>
      {/* End Navbar */}
      <div className="container-fluid py-4">
        <div className="row">
          <div className="col-12">
            <div className="card my-4 ">
              <div className="card-header p-0 position-relative mt-n4 mx-3">
                <div className="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
                  <h6 className="text-white text-capitalize ps-3 danhsachsanpham-title">
                    Bảng giá
                  </h6>
                  <button
                    className="btn bg-gradient-dark mb-0 mt-4 add-khachhang-button"
                    onClick={openModal}
                  >
                    + Thêm chi tiết
                  </button>
                </div>
              </div>
              <div className="card-body px-0 pb-2">
                <div className="table-responsive p-0">
                  <table className="table align-items-center mb-0">
                    <thead>
                      <tr>
                        <th className="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                          <b>Khoảng cách</b>
                        </th>
                        <th className="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                          <b>Giá</b>
                        </th>
                        <th className="text-secondary opacity-7" />
                      </tr>
                    </thead>
                    <tbody>
                      {(function () {
                        var result = null;
                        result = listDeliveryCost.map((value, key) => {
                          return (
                            <Item
                              costItem={value}
                              key={key}
                              addFunction={addFunction}
                              deleteFunction={deleteFunction}
                              editFunction={editFunction}
                            ></Item>
                          );
                        });
                        return result;
                      })()}
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
  );
}
