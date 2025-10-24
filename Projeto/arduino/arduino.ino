// Declaração das variáveis de controle do sensor e limites;
const int pino_sensor_mq2 = A1;
const int valor_minimo = 200;
const int valor_maximo = 1000;

// Configuração inicial do Arduino;
void setup() {
  Serial.begin(9600);
}

// Execução principal do código;
void loop() {
  // Leitura do valor analógico do sensor MQ2;
  int valorSensor = analogRead(pino_sensor_mq2);

  // Cálculo da porcentagem com base na leitura do sensor e nos valores mínimo e máximo;
  float porcentagem = ((float)(valorSensor - valor_minimo) / (valor_maximo - valor_minimo)) * 100;

  // Garante que o valor da porcentagem esteja no intervalo de 0 a 100%
  if (porcentagem < 0) {
    porcentagem = 0;
  } else if (porcentagem > 100) {
    porcentagem = 100;
  }

  // Exibe no monitor serial o valor da porcentagem calculada;
  Serial.println(porcentagem);

  // Aguarda 1 segundo antes de repetir a leitura
  delay(1000);
}
