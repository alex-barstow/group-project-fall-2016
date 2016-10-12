import React from 'react'

const Cheese = props => {

  let imageTag = <img src={props.avatar.url} />;
  if(props.avatar.url === null)
    imageTag = "";
  return (
    <li className="callout">
      <h1>
        <a href={`/cheeses/${props.id}`}>
          {props.name}
        </a>
      </h1>
      <p>{props.description}</p>
      <div className="cheese-pic">
        {imageTag}
      </div>
    </li>
  );
};

export default Cheese;
