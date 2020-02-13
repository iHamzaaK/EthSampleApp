# EthSampleApp

This app lets you see your account balance on rinkeby network and sign messages using your private key. The signed message is displayed as a QR Code. You can also validate your signed message by scanning QR code.

## Installation

Clone the repo and run it on Xcode. This app was built on Xcode Version 11.3.1 (11C504) using Swift 5.


## Usage

There are two ways to run this app. 

Enter your personal private key. \n

or

Go to SetupViewModel file and change 
```swift
init(_ title : String){
        self.title = title
       // self.testAccount()
}
```
to
```swift
init(_ title : String){
        self.title = title
        self.testAccount()
}
```

This will create a sample private key for you. 

## Under the hood
This is the first time, I have integrated blockchain API in an iOS app. Till this time, I only had theoretical knowledge about blockchain. 
 
I have used web3swift library to handle much of the APIs for Rinkeyby network but for getting an eth balance from Rinkeyby Network there was an issue with web3swift library due to recent changes done by Infura.

For getting the balance from Rinkeby Network, I had to implement Infura API by myself. 

Link for [web3swift](https://github.com/matter-labs/web3swift)

## Test Cases
I completed this during my exam week and I tried as much as I can during this hectic week to complete all the test cases but I couldn't. There are quite some test cases missing but I couldn't do much about it as I had 4 exams during the completion of this app.

## Conclusion

Please let me know my mistakes as I feel I have a lot to improve and I am always learning to improve myself.



