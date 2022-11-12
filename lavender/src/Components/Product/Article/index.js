import React from 'react'
import "./style.css"

export default function Index(props) {
    return (
        <div>
            <div dangerouslySetInnerHTML={{ __html:props.product.mota}} />
        </div>
    )
}
