import React from 'react'

const Cheese = props => {

  let imageTag = <img src={props.avatar.url} />;
  if(props.avatar.url === null)
    imageTag = "";
  return (
    <li className="callout">
      <h2 className="cheese-name">
        <a href={`/cheeses/${props.id}`}>
          {props.name}
        </a>
      </h2>
      <p className="rating">{props.formatted_rating}</p>
      <div className="cheese-pic">
        {imageTag}
      </div>
    </li>
  );
};

export default Cheese;
