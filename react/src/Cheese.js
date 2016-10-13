import React from 'react'

const Cheese = props => {

  let imageTag = <img src={props.avatar.url} />;
  if(props.avatar.url === null)
    imageTag = "";
  return (
    <li className="callout row">
      <div className = "columns small-9">
        <h2>
          <a href={`/cheeses/${props.id}`}>
            {props.name}
          </a>
        </h2>
        <p className="rating">{props.formatted_rating}</p>
      </div>
      <div className="cheese-pic columns small-3">
        {imageTag}
      </div>
    </li>
  );
};

export default Cheese;
