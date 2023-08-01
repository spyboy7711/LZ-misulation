# LZ-smisulation\
Opne Remix and put this 5 files in same folder

##Deployment
1) Deploy SendFrom.sol 
2) Deploy MagnetarMarketModule.sol 
3) Now to deploy MagnetarV2.sol give two input addresses accordingly 
        inputs : 1] address of MagnetarMarketModule
                 2] address of SendFrom.sol

##Execution 
Now deployment is done I have made this code according senario of code inside tapicaos cpntest
here we will do deleagatecall two times to same functions and with insufficient msg.value . 
first call will use all the msg.value and complete the execution just we have to check that 
1)whether the msg.value stays persist inside delegatecall ?
2)after using that mag.value to do external call inside delegat-call. second time does it all to do external call ?

Execution steps:
1) First send eth to MagnetarMarketModule using sendETH() function lets say i send 5 eth.
2) now select 1 eth inside msg.value and call burst() function .
