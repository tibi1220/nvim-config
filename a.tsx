import React from "react"
import PropTypes from "prop-types"

class Greeting extends React.Component {
  handleOnClick = () => {
    console.log("Hello")
  }

  render() {
    return (
      <div>
        <h1>Hello {this.props.name}</h1>
        <button onClick={this.handleOnClick}>Click me</button>
      </div>
    )
  }
}

Greetings.propTypes = {
  name: PropTypes.string
  language: PropTypes.string
}

ReactDOM.render(
  <Greeting  />,
document.getElementById('root')
)

