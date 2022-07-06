//+------------------------------------------------------------------+
//|                                                         v1.5.mq4 |
//|                                                              CTH |
//|                                                                  |
//+------------------------------------------------------------------+
#property copyright "CTH"
#property link      ""
#property version   "1.50"
#property strict


//-----Global variables declaration
int TotalOrders;
datetime LastActionTime;
double Ticket;
//-----Trade Variables
double Lotsize1 = 0;
double TakeProfit1 = 0; 
double StopLoss1 = 0;

double Lotsize2 = 0;
double TakeProfit2 = 0; 
double StopLoss2 = 0;

double Lotsize3 = 0;
double TakeProfit3 = 0; 
double StopLoss3 = 0;

double Lotsize4 = 0;
double TakeProfit4 = 0; 
double StopLoss4 = 0;

double Lotsize5 = 0;
double TakeProfit5 = 0; 
double StopLoss5 = 0;

double Lotsize6 = 0;
double TakeProfit6 = 0; 
double StopLoss6 = 0;

double Lotsize7 = 0;
double TakeProfit7 = 0; 
double StopLoss7 = 0;

double Slippage = 2;
int OverBought = 70;
int OverSold = 30;

//-----Trade Signals variables

//--MACD
bool MACDCrossUp1;//MACD Cross up
bool MACDCrossDown1;//MACD Cross Down

bool MACDCrossUp2;//MACD Cross up
bool MACDCrossDown2;//MACD Cross Down


bool MACDCrossUp3;//MACD Cross up
bool MACDCrossDown3;//MACD Cross Down

bool MACDCrossUp4;//MACD Cross up
bool MACDCrossDown4;//MACD Cross Down

bool MACDCrossUp5;//MACD Cross up
bool MACDCrossDown5;//MACD Cross Down

bool MACDCrossUp6;//MACD Cross up
bool MACDCrossDown6;//MACD Cross Down


//--RSI
bool RSITouchOverBought;//RSI Touch Over Bought
bool RSITouchOverSold;//RSI Touch Over Sold

bool RSITouchOverBought1;//RSI Touch Over Bought
bool RSITouchOverSold1;//RSI Touch Over Sold


bool RSITouchOverBought4;//RSI Touch Over Bought
bool RSITouchOverSold4;//RSI Touch Over Sold

//--EMA
bool EMAUpTrend; //EMA Uptrend
bool EMADownTrend; //EMA Downtrend
bool EMACrossUp;//EMA Cross Up
bool EMACrossDown;//EMA Cross Down

//--ADX

bool PriceCrossUp;
bool PriceCrossDown;

//-- END of Global variables declaration
double CalculateNormalizedDigits()
   {
   if(Digits <= 3)
      {
      return(0.01);
      }
   else
   if (Digits >= 4)
      {
      return(0.0001);
      }
   else return(0);
   }
   double nDigits = CalculateNormalizedDigits();    


void OnTick()
  {
//-----Trading indicators and signals
   double SD = iStdDev(NULL,0,20,0,MODE_EMA,PRICE_CLOSE,0);
   double ADX_0 = iADX(NULL,0,14,PRICE_CLOSE,MODE_MAIN,0); // current ADX   
   double ADX_1 = iADX(NULL,0,14,PRICE_CLOSE,MODE_MAIN,1); // 1 bar ago ADX
   double ADX_2 = iADX(NULL,0,14,PRICE_CLOSE,MODE_MAIN,2); // 2 bar ago ADX
   double ADX_3 = iADX(NULL,0,14,PRICE_CLOSE,MODE_MAIN,3); // 3 bar ago ADX   
   double MACD_0 = iMACD (NULL,0,12,26,9,PRICE_CLOSE,MODE_MAIN,0); //current MACD
   double MACD_1 = iMACD(NULL,0,12,26,9,PRICE_CLOSE,MODE_MAIN,1); //previous bar MACD
   double MACD_2 = iMACD(NULL,0,12,26,9,PRICE_CLOSE,MODE_MAIN,2); //2 bars ago MACD
   double MACD_3 = iMACD(NULL,0,12,26,9,PRICE_CLOSE,MODE_MAIN,3); //3 bars ago MACD
   double MACD_4 = iMACD(NULL,0,12,26,9,PRICE_CLOSE,MODE_MAIN,4); //4 bars ago MACD
   double MACD_5 =iMACD (NULL,0,12,26,9,PRICE_CLOSE,MODE_MAIN,5); //5 bars ago MACD
   double MACD_6 = iMACD(NULL,0,12,26,9,PRICE_CLOSE,MODE_MAIN,6); //6 bars ago MACD
   double MACD_7 = iMACD(NULL,0,12,26,9,PRICE_CLOSE,MODE_MAIN,7); //6 bars ago MACD
   double MACD_8 = iMACD(NULL,0,12,26,9,PRICE_CLOSE,MODE_MAIN,8); //6 bars ago MACD
   double MACD_9 = iMACD(NULL,0,12,26,9,PRICE_CLOSE,MODE_MAIN,9); //6 bars ago MACD
   double MACD_10 = iMACD(NULL,0,12,26,9,PRICE_CLOSE,MODE_MAIN,10); //6 bars ago MACD
   double MACD_11 = iMACD(NULL,0,12,26,9,PRICE_CLOSE,MODE_MAIN,11); //6 bars ago MACD
   double MACD_12 = iMACD(NULL,0,12,26,9,PRICE_CLOSE,MODE_MAIN,12); //6 bars ago MACD
   double RSI_0 = iRSI(NULL,0,14,PRICE_CLOSE,0); //current RSI
   double RSI_1 = iRSI(NULL,0,14,PRICE_CLOSE,1); //previus RSI
   double RSI_2 = iRSI(NULL,0,14,PRICE_CLOSE,2); //2 bars ago RSI
   double RSI_3 = iRSI(NULL,0,14,PRICE_CLOSE,3); //3 bars ago RSI
   double RSI_4 = iRSI(NULL,0,14,PRICE_CLOSE,4); //4 bars ago RSI
   double RSI_5 = iRSI(NULL,0,14,PRICE_CLOSE,5); //5 bars ago RSI
   double RSI_6 = iRSI(NULL,0,14,PRICE_CLOSE,6); //6 bars ago RSI
   double RSI_7 = iRSI(NULL,0,14,PRICE_CLOSE,7); //7 bars ago RSI
   double RSI_8 = iRSI(NULL,0,14,PRICE_CLOSE,8); //8 bars ago RSI
   double RSI_9 = iRSI(NULL,0,14,PRICE_CLOSE,9); //9 bars ago RSI
   double RSI_10 = iRSI(NULL,0,14,PRICE_CLOSE,10); //10 bars ago RSI
   double RSI_11 = iRSI(NULL,0,14,PRICE_CLOSE,11); //11 bars ago RSI 
   double RSI_12 = iRSI(NULL,0,14,PRICE_CLOSE,12); //12 bars ago RSI
   double RSI_13 = iRSI(NULL,0,14,PRICE_CLOSE,13); //13 bars ago RSI
   double RSI_14 = iRSI(NULL,0,14,PRICE_CLOSE,14); //14 bars ago RSI
   double RSI_15 = iRSI(NULL,0,14,PRICE_CLOSE,15); //15 bars ago RSI
   double RSI_16 = iRSI(NULL,0,14,PRICE_CLOSE,16); //16 bars ago RSI
   double EMA_150_0 = iMA(NULL,0,150,0,MODE_EMA,PRICE_CLOSE,0); // current 50 day EMA
   double EMA_150_1 = iMA(NULL,0,150,0,MODE_EMA,PRICE_CLOSE,1); // 1 bar ago 50 day EMA
   double EMA_150_2 = iMA(NULL,0,150,0,MODE_EMA,PRICE_CLOSE,2); // 1 bar ago 50 day EMA
   double EMA_150_3 = iMA(NULL,0,150,0,MODE_EMA,PRICE_CLOSE,3); // 1 bar ago 50 day EMA
   double EMA_150_4 = iMA(NULL,0,150,0,MODE_EMA,PRICE_CLOSE,4); // 1 bar ago 50 day EMA 
   double EMA_100_0 = iMA(NULL,0,100,0,MODE_EMA,PRICE_CLOSE,0); // 1 bar ago 50 day EMA
   double EMA_100_1 = iMA(NULL,0,100,0,MODE_EMA,PRICE_CLOSE,1); // 1 bar ago 50 day EMA
   double EMA_100_2 = iMA(NULL,0,100,0,MODE_EMA,PRICE_CLOSE,2); // 1 bar ago 50 day EMA
   double EMA_100_3 = iMA(NULL,0,100,0,MODE_EMA,PRICE_CLOSE,3); // 1 bar ago 50 day EMA
   double EMA_100_4 = iMA(NULL,0,100,0,MODE_EMA,PRICE_CLOSE,4); // 1 bar ago 50 day EMA
   double EMA_200_0 = iMA(NULL,0,200,0,MODE_EMA,PRICE_CLOSE,0) ; // current 150 day EMA
   double EMA_200_1 = iMA(NULL,0,200,0,MODE_EMA,PRICE_CLOSE,1) ; // 1 bar ago 150 day EMA
   double EMA_200_2 = iMA(NULL,0,200,0,MODE_EMA,PRICE_CLOSE,2) ; // 1 bar ago 150 day EMA
   double EMA_200_3 = iMA(NULL,0,200,0,MODE_EMA,PRICE_CLOSE,3) ; // 1 bar ago 150 day EMA
   double EMA_200_4 = iMA(NULL,0,200,0,MODE_EMA,PRICE_CLOSE,4) ; // 1 bar ago 150 day EMA
   double Price_0 = Close[0];
   double Price_1 = Close [1];
   double Price_2 = Close [2];
   double Price_3 = Close [3];
   double Price_4 = Close [4];
   
   
   //Preliminary data processing   
   double nTickValue = MarketInfo(Symbol(),MODE_TICKVALUE);
   if(Digits == 3 || Digits == 5)
   {
   nTickValue = nTickValue*10;
   }
//-----Calculate SL/TP
   StopLoss1= SD*2/nDigits;
   TakeProfit1 = SD*2/nDigits;
   Lotsize1 =(AccountBalance()*5/100)/(StopLoss1*nTickValue);
   Lotsize1 =MathRound(Lotsize1/MarketInfo(Symbol(),MODE_LOTSTEP))*MarketInfo(Symbol(),MODE_LOTSTEP);//-----MACD+RSI V.HIGH 5
   
   StopLoss2 = SD*3/nDigits;
   TakeProfit2 = SD*3/nDigits;
   Lotsize2 =(AccountBalance()*3/100)/(StopLoss2*nTickValue);
   Lotsize2 =MathRound(Lotsize2/MarketInfo(Symbol(),MODE_LOTSTEP))*MarketInfo(Symbol(),MODE_LOTSTEP);//-----MACD+RSI HIGH 5

   StopLoss3 = SD*3/nDigits;
   TakeProfit3 = SD*3/nDigits;
   Lotsize3 =(AccountBalance()*3/100)/(StopLoss3*nTickValue);
   Lotsize3 =MathRound(Lotsize3/MarketInfo(Symbol(),MODE_LOTSTEP))*MarketInfo(Symbol(),MODE_LOTSTEP);//-----MACD+RSI MID ADXSTR 3.5/4.5 (need to decide soon)
   
   StopLoss4 = SD*2/nDigits;
   TakeProfit4 = SD*2/nDigits;
   Lotsize4 =(AccountBalance()*3/100)/(StopLoss4*nTickValue);
   Lotsize4 =MathRound(Lotsize4/MarketInfo(Symbol(),MODE_LOTSTEP))*MarketInfo(Symbol(),MODE_LOTSTEP);//-----MACD+RSI MID 3.5

   StopLoss5 = SD*3/nDigits;
   TakeProfit5 = SD*3/nDigits;
   Lotsize5 =(AccountBalance()*1.5/100)/(StopLoss5*nTickValue);
   Lotsize5 =MathRound(Lotsize5/MarketInfo(Symbol(),MODE_LOTSTEP))*MarketInfo(Symbol(),MODE_LOTSTEP);//-----MACD+RSI LOW 1.5

   StopLoss6 = SD*2/nDigits;
   TakeProfit6 = SD*15/nDigits;
   Lotsize6 =(AccountBalance()*2/100)/(StopLoss6*nTickValue);
   Lotsize6 =MathRound(Lotsize6/MarketInfo(Symbol(),MODE_LOTSTEP))*MarketInfo(Symbol(),MODE_LOTSTEP);//-----TrendBounce 2
  
   StopLoss7 = SD*2/nDigits;
   TakeProfit7 = SD*15/nDigits;
   Lotsize7 =(AccountBalance()*2/100)/(StopLoss7*nTickValue);
   Lotsize7 =MathRound(Lotsize7/MarketInfo(Symbol(),MODE_LOTSTEP))*MarketInfo(Symbol(),MODE_LOTSTEP);//-----TrendBounce 2
//-----MACD
   if(MACD_0 > 0 && MACD_1 > 0 && MACD_2 < 0 && MACD_3 < 0 && MACD_4 < 0 && MACD_5 < 0 && MACD_6 < 0)
      {
      MACDCrossUp1 = true;
      }
   else MACDCrossUp1 = false;  
      
   if(MACD_0 < 0 && MACD_1 < 0 && MACD_2 > 0 && MACD_3 > 0 && MACD_4 > 0 && MACD_5 > 0 && MACD_6 > 0)
      {
      MACDCrossDown1 = true;
      }
   else MACDCrossDown1 = false;   
      
   if(MACD_0 > 0 && MACD_1 > 0 && MACD_2 < 0 && MACD_3 < 0 && MACD_4 < 0 && MACD_5 < 0 && MACD_6 < 0 && MACD_7 < 0 && MACD_8 < 0 && MACD_9 < 0 && MACD_10 < 0 )
      {
      MACDCrossUp2 = true;
      }
   else MACDCrossUp2 = false;  
      
   if(MACD_0 < 0 && MACD_1 < 0 && MACD_2 > 0 && MACD_3 > 0 && MACD_4 > 0 && MACD_5 > 0 && MACD_6 > 0 && MACD_7 > 0 && MACD_8 > 0 && MACD_9 > 0 && MACD_10 > 0 )
      {
      MACDCrossDown2 = true;
      }
   else MACDCrossDown2 = false;   


   if(MACD_0 > 0 && MACD_1 < 0 && MACD_2 < 0 && MACD_3 < 0 && MACD_4 < 0 && MACD_5 < 0 && MACD_6 < 0 && MACD_7 < 0 && MACD_8 < 0)
      {
      MACDCrossUp3 = true;
      }
   else MACDCrossUp3 = false;  
      
   if(MACD_0 < 0 && MACD_1 > 0 && MACD_2 > 0 && MACD_3 > 0 && MACD_4 > 0 && MACD_5 > 0 && MACD_6 > 0 && MACD_7 > 0 && MACD_8 > 0 )
      {
      MACDCrossDown3 = true;
      }
   else MACDCrossDown3 = false;   
      
   if(MACD_0 > 0 && MACD_1 > 0 && MACD_2 < 0 && MACD_3 < 0 && MACD_4 < 0 && MACD_5 < 0 && MACD_6 < 0 && MACD_7 < 0 && MACD_8 < 0)
      {
      MACDCrossUp4 = true;
      }
   else MACDCrossUp4 = false;  
      
   if(MACD_0 < 0 && MACD_1 < 0 && MACD_2 > 0 && MACD_3 > 0 && MACD_4 > 0 && MACD_5 > 0 && MACD_6 > 0 && MACD_7 > 0 && MACD_8 > 0)
      {
      MACDCrossDown4 = true;
      }
   else MACDCrossDown4 = false;  
   
   if(MACD_0 > 0 && MACD_1 < 0 && MACD_2 < 0 && MACD_3 < 0 && MACD_4 < 0 && MACD_5 < 0 && MACD_6 < 0 && MACD_7 < 0 && MACD_8 < 0 && MACD_9 < 0 && MACD_10 < 0 && MACD_11 < 0 && MACD_12 < 0)
      {
      MACDCrossUp5 = true;
      }
   else MACDCrossUp5 = false;  
      
   if(MACD_0 < 0 && MACD_1 > 0 && MACD_2 > 0 && MACD_3 > 0 && MACD_4 > 0 && MACD_5 > 0 && MACD_6 > 0 && MACD_7 > 0 && MACD_8 > 0 && MACD_9 > 0 && MACD_10 > 0 && MACD_11 > 0 && MACD_12 > 0 )

      {
      MACDCrossDown5 = true;
      }
   else MACDCrossDown5 = false;   
   
//-----EMA
   if(EMA_100_0 > EMA_200_0 && EMA_100_1 > EMA_200_1 && EMA_100_2 > EMA_200_2)
      {
      EMAUpTrend = true;
      }
   else EMAUpTrend = false;
      
   if(EMA_100_0 < EMA_200_0 && EMA_100_1 < EMA_200_1 && EMA_100_2 < EMA_200_2)
      {
      EMADownTrend = true;
      }
   else EMADownTrend = false;
      
   if(EMA_100_0 > EMA_200_0 && EMA_100_1 < EMA_200_1)
      {
      EMACrossUp = true;
      }
   else EMACrossUp = false;
      
   if(EMA_100_0 < EMA_200_0  && EMA_100_1 > EMA_200_1)
      {
      EMACrossDown = true;
      }
   else EMACrossDown = false;
     
 
//----- Current Price Crossover

   if (Price_0 > EMA_200_0 && Price_1 < EMA_200_1 ) 
      {
      PriceCrossUp = true;
      }
   else PriceCrossUp = false;    

   if (Price_0 < EMA_200_0 && Price_1 > EMA_200_1 ) 
      {
      PriceCrossDown = true;
      }
   else PriceCrossDown = false;    
    
//-----RSI  
   if((RSI_1 <= OverSold || RSI_2 <= OverSold || RSI_3 <= OverSold || RSI_4 <= OverSold || RSI_5 <= OverSold || 
      RSI_6 <= OverSold || RSI_7 <= OverSold || RSI_8 <= OverSold || RSI_9 <= OverSold || RSI_10 <= OverSold || RSI_11 <= OverSold || 
      RSI_12 <= OverSold))
      {
      RSITouchOverSold = true;    
      }
   else RSITouchOverSold = false;   
                      
   if((RSI_1 >= OverBought || RSI_2 >= OverBought || RSI_3 >= OverBought || RSI_4 >= OverBought || RSI_5 >= OverBought || 
      RSI_6 >= OverBought || RSI_7 >= OverBought || RSI_8 >= OverBought || RSI_9 >= OverBought || RSI_10 >= OverBought || RSI_11 >= OverBought || 
      RSI_12 >= OverBought))
      {
      RSITouchOverBought = true;
      }
   else RSITouchOverBought = false;

//-----RSI  
   if((RSI_1 <= OverSold || RSI_2 <= OverSold || RSI_3 <= OverSold || RSI_4 <= OverSold || RSI_5 <= OverSold || 
      RSI_6 <= OverSold || RSI_7 <= OverSold || RSI_8 <= OverSold || RSI_9 <= OverSold || RSI_10 <= OverSold))
      {
      RSITouchOverSold1 = true;    
      }
   else RSITouchOverSold1 = false;   
                      
   if((RSI_1 >= OverBought || RSI_2 >= OverBought || RSI_3 >= OverBought || RSI_4 >= OverBought || RSI_5 >= OverBought || 
      RSI_6 >= OverBought || RSI_7 >= OverBought || RSI_8 >= OverBought || RSI_9 >= OverBought || RSI_10 >= OverBought))
      {
      RSITouchOverBought1 = true;
      }
   else RSITouchOverBought1 = false;

   if( RSI_0 > OverSold && (RSI_1 <= OverSold || RSI_2 <= OverSold || RSI_3 <= OverSold || RSI_4 <= OverSold || RSI_5 <= OverSold || 
      RSI_6 <= OverSold || RSI_7 <= OverSold || RSI_8 <= OverSold || RSI_9 <= OverSold || RSI_10 <= OverSold || RSI_11 <= OverSold || 
      RSI_12 <= OverSold))
      {
      RSITouchOverSold4 = true;    
      }
   else RSITouchOverSold4 = false;   
                      
   if( RSI_0 < OverBought && (RSI_1 >= OverBought || RSI_2 >= OverBought || RSI_3 >= OverBought || RSI_4 >= OverBought || RSI_5 >= OverBought || 
      RSI_6 >= OverBought || RSI_7 >= OverBought || RSI_8 >= OverBought || RSI_9 >= OverBought || RSI_10 >= OverBought || RSI_11 >= OverBought || 
      RSI_12 >= OverBought))
      {
      RSITouchOverBought4 = true;
      }
   else RSITouchOverBought4 = false;


//-- END of Trading indicators and signals



//-----Order management function
   if (LastActionTime != Time[0]) // To execute this part of the code only once per bar
      {
//-----Close orders
      if(OrdersTotal()>0)
         {
         for(int i=OrdersTotal()-1; i >= 0; i--)
            {
            if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
               {
               if(OrderType() == OP_BUY)
                  {
                  if(OrderMagicNumber() == 1) //-----MACD+RSI V.HIGH
                     {
                     if((RSI_0 > 70 && ADX_0 > 50))
                        {
                        OrderClose(OrderTicket(),OrderLots(),Bid,Slippage,Green);
                        }
                     }
                  else
                  if(OrderMagicNumber() == 2)
                     {
                     if((RSI_0 > 70 && ADX_0 > 45) || RSI_0 > 75 || (MACDCrossDown2 == true && ADX_0 > 50)) //-----MACD+RSI HIGH
                        {
                        OrderClose(OrderTicket(),OrderLots(),Bid,Slippage,Green);
                        }
                     }
                  else
                  if(OrderMagicNumber() == 3)
                     {
                     if((RSI_0 > 70 && ADX_0 > 25 && ADX_0 < 50)|| (RSI_0 > 80) || (RSI_0 < 30 && ADX_0 > 50)) // MACD+RSI MID ADXSTR
                        {
                        OrderClose(OrderTicket(),OrderLots(),Bid,Slippage,Green);
                        }
                     }
                  else
                  if(OrderMagicNumber() == 4) //-----MACD+RSI MID
                     {
                     if(1==0)
                        {
                        OrderClose(OrderTicket(),OrderLots(),Bid,Slippage,Green);
                        }
                     }
                  else
                  if(OrderMagicNumber() == 5) // MACD+RSI LOW
                     {
                     if((RSI_0 > OverBought && (ADX_0 < 30 || ADX_0 > 50)) || RSI_0 > OverBought + 5 || RSI_0 < OverSold)
                        {
                        OrderClose(OrderTicket(),OrderLots(),Bid,Slippage,Green);
                        }
                     }
                  if(OrderMagicNumber() == 6) //TrendBounce
                     {
                     if(PriceCrossDown == true || RSI_0 > 70 || RSI_0 < 30 || (RSI_0 < 40 && ADX_0 > 25) || 
                        (RSI_0 < 50 && ADX_0 > 50) || (RSI_0 > 65 && ADX_0 > 25) || (RSI_0 > 60 && 
                        ADX_0 > 50))
                        {
                        OrderClose(OrderTicket(),OrderLots(),Bid,Slippage,Green);
                        }
                     }
                  if(OrderMagicNumber() == 7) //TrendBounce
                     {
                     if(PriceCrossDown == true || (RSI_0 > 60 && ADX_0 > 25 && ADX_0 < 50) || RSI_0 > 70 || RSI_0 > 70 || RSI_0 < 30 )
                        {
                        OrderClose(OrderTicket(),OrderLots(),Bid,Slippage,Green);
                        }
                     }
                  }
               else   
               if(OrderType() == OP_SELL)
                  {
                  if( OrderMagicNumber() == 1) //-----MACD+RSI V.HIGH
                     {
                     if((RSI_0 < 30 && ADX_0 > 50))
                        {
                        OrderClose(OrderTicket(),OrderLots(),Ask,Slippage,Red);
                        }
                     }
                  else
                  if( OrderMagicNumber() == 2)
                     {
                     if((RSI_0 < 30 && ADX_0 > 45) || RSI_0 < 25 || (MACDCrossUp2 == true && ADX_0 > 50)) //-----MACD+RSI HIGH
                        {
                        OrderClose(OrderTicket(),OrderLots(),Ask,Slippage,Red);
                        }
                     }
                  if( OrderMagicNumber() == 3)
                     {
                     if((RSI_0 < 30 && ADX_0 > 25 && ADX_0 < 50) || (RSI_0 < 20) || (RSI_0 > 70 && ADX_0 > 50)) // MACD+RSI MID ADXSTR
                        {
                        OrderClose(OrderTicket(),OrderLots(),Ask,Slippage,Red);
                        }
                     }
                  else
                  if( OrderMagicNumber() == 4) //-----MACD+RSI MID
                     {
                     if(1==0)
                        {
                        OrderClose(OrderTicket(),OrderLots(),Ask,Slippage,Red);
                        }
                     }
                  if( OrderMagicNumber() == 5) // MACD+RSI LOW
                     {
                     if( (RSI_0 < OverSold && (ADX_0 < 30 || ADX_0 > 50)) || RSI_0 < OverSold -5 || RSI_0 > OverBought)
                        {
                        OrderClose(OrderTicket(),OrderLots(),Ask,Slippage,Red);
                        }
                     }
                  if( OrderMagicNumber() == 6) //TrendBounce
                     {
                     if(PriceCrossUp == true || RSI_0 < 30 || RSI_0 > 70 || (RSI_0 > 60 && ADX_0 > 25) || 
                        (RSI_0 > 50 && ADX_0 > 50) || (RSI_0 < 35 && ADX_0 > 25) || (RSI_0 < 40 && 
                        ADX_0 > 50))
                        {
                        OrderClose(OrderTicket(),OrderLots(),Ask,Slippage,Red);
                        }
                     }
                  if( OrderMagicNumber() == 7) //TrendBounce
                     {
                     if(PriceCrossUp == true || (RSI_0 < 40 && ADX_0 > 25 && ADX_0 < 50) || RSI_0 < 30 ||RSI_0 < 30 || RSI_0 > 70 )
                        {
                        OrderClose(OrderTicket(),OrderLots(),Ask,Slippage,Red);
                        }
                     }
                  }
               }
            }
         }      
      
      if(OrdersTotal()<1)
         {      
//-----Open orders
         if ((RSITouchOverSold1 == true && RSITouchOverBought1 == false && MACDCrossUp1 == true &&  //MACD+RSI V.HIGH
            RSI_0 < OverBought && ADX_0 < 50 && SD/nDigits > 30 && SD/nDigits < 60)) // Buy Conditions
            {
            if(OrderSend(NULL,OP_BUY,Lotsize1,Ask,Slippage,Ask-(StopLoss1*nDigits),Ask+(TakeProfit1*nDigits),NULL,1,0,Green))
               {
               Alert("Open Buy - V.High MACD");
               }
            else
               {
               Alert("Failed to Open Buy - V.High MACD due to : ", GetLastError());   
               }
            }
         else
         if ((RSITouchOverBought1 == true && RSITouchOverSold1 == false && MACDCrossDown1 == true && //MACD+RSI V.HIGH
            RSI_0 > OverSold && ADX_0 < 50 && SD/nDigits > 30 && SD/nDigits < 60)) // Sell Conditions
            {
            if(OrderSend(NULL,OP_SELL,Lotsize1,Bid,Slippage,Bid+(StopLoss1*nDigits),Bid-(TakeProfit1*nDigits),NULL,1,0,Red))
               {
               Alert("Open Sell - V.High MACD");
               }
            else
               {
               Alert("Failed to Open Sell - V.High MACD due to : ", GetLastError());   
               }
            }
         else
         if ((RSITouchOverSold == true && RSITouchOverBought == false && MACDCrossUp2 == true && RSI_0 < 70 &&  //MACD+RSI HIGH
            ADX_0 < 35 && SD/nDigits > 20 && SD/nDigits < 30)) // Buy Conditions
            {
            if(OrderSend(NULL,OP_BUY,Lotsize2,Ask,Slippage,Ask-(StopLoss2*nDigits),Ask+(TakeProfit2*nDigits),NULL,2,0,Green))
               {
               Alert("Open Buy - High MACD");
               }
            else
               {
               Alert("Failed to Open Buy - High MACD due to : ", GetLastError());   
               }
            }
         else
         if ((RSITouchOverBought == true && RSITouchOverSold == false && MACDCrossDown2 == true&& RSI_0 > 30 && //MACD+RSI HIGH
            ADX_0 < 35 && SD/nDigits > 20 && SD/nDigits < 30)) // Sell Conditions
            {
            if(OrderSend(NULL,OP_SELL,Lotsize2,Bid,Slippage,Bid+(StopLoss2*nDigits),Bid-(TakeProfit2*nDigits),NULL,2,0,Red))
               {
               Alert("Open Sell - High MACD");
               }
            else
               {
               Alert("Failed to Open Sell - High MACD due to : ", GetLastError());   
               }
            }      
         
         else
         if ((RSITouchOverSold == true && RSITouchOverBought == false && MACDCrossUp3 == true && RSI_0 < 60 && // MACD+RSI MID ADXSTR
            ADX_0 > 25 && ADX_0 < 50 && SD/nDigits > 10 && SD/nDigits < 20)) 
            {
            if(OrderSend(NULL,OP_BUY,Lotsize3,Ask,Slippage,Ask-(StopLoss3*nDigits),Ask+(TakeProfit3*nDigits),NULL,3,0,Green))
               {
               Alert("Open Buy - MACD");
               }
            else
               {
               Alert("Failed to Open Buy - MACD due to : ", GetLastError());   
               }
            }
         else
         if ((RSITouchOverBought == true && RSITouchOverSold == false && MACDCrossDown3 == true && RSI_0 > 40 && // MACD+RSI MID ADXSTR
            ADX_0 > 25 && ADX_0 < 50 && SD/nDigits > 10 && SD/nDigits < 20)) 
            {
            if(OrderSend(NULL,OP_SELL,Lotsize3,Bid,Slippage,Bid+(StopLoss3*nDigits),Bid-(TakeProfit3*nDigits),NULL,3,0,Red))
               {
               Alert("Open Sell - MACD");
               }
            else
               {
               Alert("Failed to Open Sell - MACD due to : ", GetLastError());   
               }
            }
         else
         if ((RSITouchOverSold4 == true && RSITouchOverBought4 == false && MACDCrossUp4 == true && ADX_0 < 25 && // MACD+RSI MID
            SD/nDigits > 10 && SD/nDigits < 20)) // Buy Conditions
            {
            if(OrderSend(NULL,OP_BUY,Lotsize4,Ask,Slippage,Ask-(StopLoss4*nDigits),Ask+(TakeProfit4*nDigits),NULL,4,0,Green))
               {
               Alert("Open Buy - MID MACD");
               }
            else
               {
               Alert("Failed to Open Buy - MID MACD due to : ", GetLastError());   
               }
            }
         else
         if ((RSITouchOverBought4 == true && RSITouchOverSold4 == false && MACDCrossDown4 == true && ADX_0 < 25 && // MACD+RSI MID
            SD/nDigits > 10 && SD/nDigits < 20)) 
            {
            if(OrderSend(NULL,OP_SELL,Lotsize4,Bid,Slippage,Bid+(StopLoss4*nDigits),Bid-(TakeProfit4*nDigits),NULL,4,0,Red))
               {
               Alert("Open Sell - MID MACD");
               }
            else
               {
               Alert("Failed to Open Sell - MID MACD due to : ", GetLastError());   
               }
            }
         else
         if ((RSITouchOverSold == true && RSITouchOverBought == false && MACDCrossUp5 == true && RSI_0 < 65 && // MACD+RSI LOW
             ADX_0 > 30 && SD/nDigits > 3 && SD/nDigits < 10)) // Buy Conditions
            {
            if(OrderSend(NULL,OP_BUY,Lotsize5,Ask,Slippage,Ask-(StopLoss5*nDigits),Ask+(TakeProfit5*nDigits),NULL,5,0,Green))
               {
               Alert("Open Buy - Low MACD");
               }
            else
               {
               Alert("Failed to Open Buy - Low MACD due to : ", GetLastError());   
               }
            }
         else
         if ((RSITouchOverBought == true && RSITouchOverSold == false && MACDCrossDown5 == true && RSI_0 > 35 && // MACD+RSI LOW
             ADX_0 > 30 && SD/nDigits > 3 && SD/nDigits < 10)) // Sell Conditions
            {
            if(OrderSend(NULL,OP_SELL,Lotsize5,Bid,Slippage,Bid+(StopLoss5*nDigits),Bid-(TakeProfit5*nDigits),NULL,5,0,Red))
               {
               Alert("Open Sell - Low MACD");
               }
            else
               {
               Alert("Failed to Open Sell - Low MACD due to : ", GetLastError());   
               }
            }
         else
         if (EMAUpTrend == true && PriceCrossUp == true && ADX_0 < 50 && SD/nDigits < 10 && SD/nDigits > 3) //TrendBounce
            {
            if(OrderSend(NULL,OP_BUY,Lotsize6,Ask,Slippage,Ask-(StopLoss6*nDigits),Ask+(TakeProfit6*nDigits),NULL,6,0,Green))
               {
               Alert("Open Buy - TrendBounce");
               }
            else
               {
               Alert("Failed to Open Buy - TrendBounce due to : ", GetLastError());   
               }
            }
         else
         if (EMADownTrend == true && PriceCrossDown == true && ADX_0 < 50 && SD/nDigits < 10 && SD/nDigits > 3) //TrendBounce
            {
            if(OrderSend(NULL,OP_SELL,Lotsize6,Bid,Slippage,Bid+(StopLoss6*nDigits),Bid-(TakeProfit6*nDigits),NULL,6,0,Red))
               {
               Alert("Open Sell - TrendBounce");
               }
            else
               {
               Alert("Failed to Open Sell - TrendBounce due to : ", GetLastError());   
               }
            }
         else
         if (EMAUpTrend == true && PriceCrossUp == true &&  RSI_0 < 70 && SD/nDigits < 20 && SD/nDigits > 10 ) // Buy Conditions
            {
            if(OrderSend(NULL,OP_BUY,Lotsize7,Ask,Slippage,Ask-(StopLoss7*nDigits),Ask+(TakeProfit7*nDigits),NULL,7,0,Green))
               {
               Alert("Open Buy - TrendBounce 2");
               }
            else
               {
               Alert("Failed to Open Buy - TrendBounce due to : ", GetLastError());   
               }
            }
         else
         if (EMADownTrend == true && PriceCrossDown == true && RSI_0 > 30 && SD/nDigits < 20 && SD/nDigits > 10 ) // Sell Conditions
            {
            if(OrderSend(NULL,OP_SELL,Lotsize7,Bid,Slippage,Bid+(StopLoss7*nDigits),Bid-(TakeProfit7*nDigits),NULL,7,0,Red))
               {
               Alert("Open Sell - TrendBounce 2");
               }
            else
               {
               Alert("Failed to Open Sell - TrendBounce due to : ", GetLastError());   
               }
            }
         }               
      LastActionTime = Time[0];
      }
//-----End of Order management function
  }
//+------------------------------------------------------------------+
//BUY CONDITIONS THAT WORK
//(RSIThrough == true && EMAUpTrend == true && ADXWeak == true) // TP/SL:30
//(RSITouchOverSold == true && MACDCrossUp == true && EMAUpTrend == true && RSI_0 < OverBought) // TP/SL:50
//
//
//

//SELL CONDITIONS THAT WORK
//(RSIPeak == true && EMADownTrend == true && ADXWeak == true) // TP/SL:30
//(RSITouchOverBought == true && MACDCrossDown == true && EMADownTrend == true && RSI_0 > OverSold) // TP/SL:50
//
//
//
//+------------------------------------------------------------------+