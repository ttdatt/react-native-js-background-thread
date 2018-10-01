/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, {Component} from 'react';
import {Platform, StyleSheet, Text, View, TouchableOpacity} from 'react-native';
import {runAsync} from 'react-native-js-background-thread';

const instructions = Platform.select({
  ios: 'Press Cmd+R to reload,\n' + 'Cmd+D or shake for dev menu',
  android:
    'Double tap R on your keyboard to reload,\n' +
    'Shake or press menu button for dev menu'
});

type Props = {};
export default class App extends Component<Props> {

  constructor() {
    super()
    this.state = {
      result: ''
    }
  }

  runMe(a, b) {
    let count = 0
    for (let i = 0; i < a; i++) {
      for (let j = 0; j < b; j++) {
        count++
      }
    }

    return JSON.stringify(count)
  }

  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>Welcome to React Native!</Text>
        <Text style={styles.instructions}>To get started, edit App.js</Text>
        <Text style={styles.instructions}>{instructions}</Text>
        <Text style={styles.instructions}>{this.state.result}</Text>
        <TouchableOpacity
          style={{padding: 8, backgroundColor: 'gray', marginBottom: 8}}
          onPress={() => {
            runAsync(this.runMe, 'runMe', [200000, 10000])
              .then(result => {
                console.log('output: ', result)
                this.setState({result: result})
              })
          }}>
          <Text>Run async</Text>
        </TouchableOpacity>

        <TouchableOpacity
          style={{padding: 8, backgroundColor: 'gray'}}
          onPress={() => {
            const result = this.runMe(200000, 10000)
            this.setState({result})
          }}>
          <Text>Run sync</Text>
        </TouchableOpacity>

        <TouchableOpacity
          style={{padding: 8, backgroundColor: 'gray', marginTop: 8}}
          onPress={() => {
            this.setState({result: ''})
          }}>
          <Text>Reset</Text>
        </TouchableOpacity>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF'
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5
  }
});
