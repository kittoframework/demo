import React from 'react';
import Widget from '../../assets/javascripts/widget';
import {updatedAt} from '../../assets/javascripts/helpers';

import './travis.scss';

class ListItem extends React.Component {
  render() {
    return (
      <li>
        <span className="label">{this.props.label}</span>
        <span className={this.props.value}>●</span>
      </li>
    );
  }
}

Widget.mount(class Travis extends Widget {
  renderItems(items) {
    return items.map((item, i) => {
      return <ListItem key={i} label={item.label} value={item.value}/>;
    });
  }
  renderList(items) {
    return this.props.unordered ? <ul>{items}</ul> : <ol>{items}</ol>;
  }
  render() {
    return (
      <div className={this.props.className}>
        <h1 className="title">{this.props.title}</h1>
        <h3>{this.props.text}</h3>
        <ul>
          {this.renderList(this.renderItems(this.state.items || []))}
        </ul>
        <p className="updated-at">{updatedAt(this.state.updated_at)}</p>
      </div>
    );
  }
});
