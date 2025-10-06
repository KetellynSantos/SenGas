const int pino_sensor_mq2 = A1;
const int valor_minimo = 100;
const int valor_maximo = 1000;

void setup() {
  Serial.begin(9600);
}

void loop() {
  int valorSensor = analogRead(pino_sensor_mq2);

  float porcentagem = ((float)(valorSensor - valor_minimo) / (valor_maximo - valor_minimo)) * 100;

  if (porcentagem < 0) {
    porcentagem = 0;
  } else if (porcentagem > 100) {
    porcentagem = 100;
  }

  Serial.print("porcentagem:");
  Serial.print(porcentagem);
  Serial.print(" ");
  Serial.print("porcMaximo:");
  Serial.println(35);

  delay(1000);
}
