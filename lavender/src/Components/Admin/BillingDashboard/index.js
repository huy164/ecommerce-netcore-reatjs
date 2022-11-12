import React, { useState, useEffect } from "react";
import * as hoadonAPI from "../../apis/billing";
import * as noteAPI from "../../apis/note";
import BillItem from "./BillItem";
import ImportItem from "./ImportItem";
import "./style.css";
import AddBill from "./AddBill";
import AddNote from "./AddNote";
import Cookies from "universal-cookie";
import LoadingContainer from "../../../Common/helper/loading/LoadingContainer";
import * as fileApi from "../../apis/file";

const FileDownload = require("js-file-download");

const cookie = new Cookies();

export default function Index(props) {
  const [billing, setBilling] = useState();
  const [importBilling, setImportBilling] = useState();
  const [modal, setModal] = useState(0);
  const [loading, setLoading] = useState();
  const [tungay1, setTungay1] = useState(new Date());
  const [denngay1, setDenngay1] = useState(new Date());
  const [tungay2, setTungay2] = useState(new Date());
  const [denngay2, setDenngay2] = useState(new Date());

  const showModal = (index) => {
    setModal(index);
  };
  const hideModal = () => {
    setModal(0);
  };
  async function loadBill() {
    var token = cookie.get("token");
    var refreshtoken = cookie.get("refreshtoken");
    await hoadonAPI
      .twentyhoadon(token, refreshtoken)
      .then((success) => {
        setBilling(success.data.value.$values);
        console.log(success.data.value.$values);
      })
      .catch((error) => {
        console.error(error);
      });
  }

  async function loadImport() {
    setLoading(true);
    var token = cookie.get("token");
    var refreshtoken = cookie.get("refreshtoken");
    await noteAPI
      .importNote(token, refreshtoken)
      .then((success) => {
        if (success.status === 200) {
          setImportBilling(importBilling);
        }
      })
      .catch((error) => {
        console.error(error);
      });
  }
  useEffect(() => {
    (async () => {
      setLoading(true);
      await Promise.allSettled([loadBill(), loadImport()])
        .then((results) =>
          results.forEach((result) => console.log(result.status))
        )
        .catch((error) => {
          console.error(error);
        });
      setLoading(false);
    })();
  }, []);

  function xuatFileHoadon() {
    fileApi
      .xuatHoadon(
        new Date(tungay1).toISOString().split("T")[0],
        new Date(denngay1).toISOString().split("T")[0],
        cookie.get("token"),
        cookie.get("refreshtoken")
      )
      .then((success) => {
        if (success.status === 200) {
          var fileName=tungay1.toDateString()+"----"+tungay2.toDateString()+".xlsx";
          console.log(fileName);
          FileDownload(success.data,fileName);
        }
      })
      .catch((error) => {
        console.log(error);
      });
  }
  function xuatFilePhieunhap() {
    fileApi
      .xuatPhieunhap(
        new Date(tungay2).toISOString().split("T")[0],
        new Date(denngay2).toISOString().split("T")[0],
        cookie.get("token"),
        cookie.get("refreshtoken")
      )
      .then((success) => {
        if (success.status === 200) {
          FileDownload(success.data, "phieunhap.xlsx");
        }
      })
      .catch((error) => {
        console.log(error);
      });
  }
  return (
    <main className="main-content position-relative border-radius-lg left-menu" style={{ minWidth: "1100px" }}>
      <LoadingContainer loading={loading}></LoadingContainer>
      <>
        {(() => {
          if (modal === 1)
            return (
              <AddBill
                handleClose={hideModal}
                handleSave={() => {
                  loadBill();
                  hideModal();
                }}
              ></AddBill>
            );
          else if (modal === 2)
            return (
              <AddNote
                handleClose={hideModal}
                handleSave={() => {
                  loadImport();
                  hideModal();
                }}
              ></AddNote>
            );
        })()}
      </>
      {/* End Navbar */}
      <div className="container-sm py-4">
        <div className="row">
          <div className="col-4">
            <div className="card h-auto card-xuatfile">
              <div className="pb-0 p-3">
                <div className="row">
                  <div className="col-7 d-flex align-items-center">
                    <h6 className="mb-0">Xuất file thống kê</h6>
                  </div>
                </div>
              </div>
              <div className="card-body p-3 pb-0">
                <ul >
                  <li className="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
                    <div className="d-flex flex-column">
                      <h6 className="text-dark font-weight-bold text-sm">
                        Hoá đơn bán
                      </h6>

                      <div>
                        <div className="">
                          <span className="text-xs">Từ ngày </span>
                          <input
                            className="form-control border "
                            type="date"
                            id="start"
                            name="trip-start"
                            onChange={(e) =>
                              setTungay1(new Date(e.target.value))
                            }
                            value={tungay1.toISOString().split("T")[0]}
                          ></input>
                        </div>
                      </div>
                      <div>
                        <div className="">
                          <span className="text-xs">Đến ngày </span>
                          <input
                            className="form-control border "
                            type="date"
                            id="start"
                            name="trip-start"
                            onChange={(e) =>
                              setDenngay1(new Date(e.target.value))
                            }
                            value={denngay1.toISOString().split("T")[0]}
                          ></input>
                        </div>
                      </div>
                    </div>
                    <div className="d-flex align-items-center text-sm">
                      <button
                        className="btn btn-link text-dark display-1"
                        id="fileban"
                        onClick={xuatFileHoadon}
                      >
                        <h1>
                          <i class="bi bi-file-earmark-excel"></i>
                        </h1>
                      </button>
                    </div>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div className="row">
        <div className="col-md-7">
          <div className="card">
            <h6 className="card-header mb-0">Đơn hàng</h6>
            <div className="pb-0 px-3">
              <div className="row">
                <div className="btn-add-bill">
                  <a
                    href={() => false}
                    className="btn bg-gradient-dark mb-0 mt-4 "
                    onClick={() => showModal(1)}
                  >
                    <i class="bi bi-plus"></i> Thêm mới hoá đơn
                  </a>
                </div>
              </div>
            </div>

            <div className="card-body pt-4 p-3">
              <ul className="list-group">
                {billing !== undefined &&
                  billing.map((value, key) => {
                    return (
                      <BillItem
                        bill={value}
                        key={key}
                        handleSave={loadBill}
                      ></BillItem>
                    );
                  })}
              </ul>
            </div>
          </div>
        </div>
        <div className="col-md-5">
          <div className="card ">
            <h6 className="card-header">Phiếu nhập kho </h6>
            <div className="pb-0 px-3">
              <div className="row">
                <div className="btn-import-bill mt-4">
                  <a
                    href={() => false}
                    className="btn bg-gradient-dark"
                    onClick={() => showModal(2)}
                  >
                    <i class="bi bi-plus"></i> Thêm mới phiếu nhập
                  </a>
                </div>

              </div>
            </div>

            <div className="card-body pt-4 p-3">
              <ul className="list-group">
                {importBilling !== undefined &&
                  importBilling.map((value, key) => {
                    return (
                      <ImportItem
                        bill={value}
                        key={key}
                        handleSave={loadImport}
                      ></ImportItem>
                    );
                  })}
              </ul>
            </div>
          </div>
        </div>
      </div>
    </main>
  );
}
