import React from 'react'
import Cheese from './Cheese'

const CheeseList = props => {
  let cheeses = props.data.map(cheese => {
    return (
      <Cheese
        key={cheese.id}
        id={cheese.id}
        name={cheese.name}
        age={cheese.age}
        description={cheese.description}
        avatar={cheese.avatar}
      />
    );
  });
  return (
    <div>
      <ul className="cheeselist column small-12">
        {cheeses}
      </ul>
    </div>
  );
};

export default CheeseList;
