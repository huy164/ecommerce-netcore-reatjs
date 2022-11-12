
import React from "react";

export default function Item(props) {
    return (
        <div>
          <table class="table">
            <thead class="table-light">
                <tr>
                  <td><strong>Ngày bảo hành</strong></td>
                  <td><strong>Chi phí</strong></td>
                  <td><strong>Ghi chú</strong></td>
                </tr>
            </thead>
            <tbody>
                <tr>
                  <td>{props.item.ngaybaohanh}</td>
                  <td>{props.item.chiphi}</td>
                  <td>{props.item.ghichu}</td>
                </tr>
            </tbody>
          </table>
     
        
        </div>
    );
  
}