# LZ-smisulation\
Open Remix and put these 5 files in the same folder

# Deployment
1) Deploy SendFrom.sol 
2) Deploy MagnetarMarketModule.sol 
3) Now to deploy MagnetarV2.sol give two input addresses accordingly 
        inputs: 1] address of MagnetarMarketModule
                 2] address of SendFrom.sol

# Execution
Now deployment is done I have made this code according to senario of code inside Tapicaos contest
here we will do a delegate-call two times to the same functions and with insufficient msg.value . 
the first call will use all the msg.value and complete the execution just we have to check that 

1)whether the msg.value stays persist inside delegate-call?

2)after using that mag.value to do external calls inside delegat-call. second time does it allows to do external call using contracts balance?

Execution steps: (We will see information related to transactions inside console.logs)
1) First send eth to MagnetarMarketModule using sendETH() function lets say i send 5 eth.
2) now select 1 eth inside msg.value and call burst() function.

You will see out put like this 
```
Inside _withdraw() function msg.value is :
1000000000000000000
Inside Sendfrom received value is
1000000000000000000
result of calling sendFrom
true
result of delegatecall
true
Inside _withdraw() function msg.value is :
1000000000000000000
result of delegatecall
false
```
# Breackdown the Output
1)first it does delegate-call to withdraw() function which internally calls _withdraw(). Inside _withdraw() first it prints value of msg.value = 1000000000000000000

2) Next it does an external call to sendFrom() inside _withdrawToChain().  and sendFrom will receive all the ethers 

3) Now it prints the result of calling sendFrom.

4) Now it prints the result of calling delegatecall to withdraw(). here first transaction completes

5) now for the second iteration it again delegate-call to withdraw() function which internally calls _withdraw().
   Inside _withdraw() first it prints the value of msg.value = 1000000000000000000. ***Which shows that the value of msg.sender stays persists***

6) Now it does an external call to sendFrom() and fail because it doesn't have sufficient eth to do an external call and pass msg.value to sendFrom(). it only prints the result of delegate-call and doesn't print the result of sendFrom() because it failed.
   ***Another catch over here is that inside _withdraw() there is a  mechanism to set gas value as address(this).balance if msg.value < 0 which is able to bypass because the value of msg.value was persisted***

# Concution 

This shows that the mechanism which sends gas from contract balance if msg.value is less than 0 will fail if these two functions were called by using burst() function 

