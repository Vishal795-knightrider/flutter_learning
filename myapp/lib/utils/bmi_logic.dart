class BmiLogic{
 static double calculate(double w,double h){final x=h/100;return w/(x*x);}
 static String category(double b){if(b<18.5)return 'Underweight'; if(b<25)return 'Normal'; if(b<30)return 'Overweight'; return 'Obese';}
 static String message(double b){if(b<18.5)return 'Eat healthy.'; if(b<25)return 'Great shape!'; if(b<30)return 'Exercise more.'; return 'Consult doctor.';}
}