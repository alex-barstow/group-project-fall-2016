import React from 'react'

const Cheese = props => {
  return (
    <li className="callout">
      <h1>
        <a href={`/cheeses/${props.id}`}>
          {props.name}
        </a>
      </h1>
      <p>{props.description}</p>
    </li>
  );
};

export default Cheese;
