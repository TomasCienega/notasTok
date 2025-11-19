
//Un arreglo (array) es una estructura de datos que te permite guardar varios valores del mismo tipo en una sola variable, organizados en posiciones (índices).
//Piensa en un arreglo como una fila de casillas, donde cada casilla guarda un valor.

int[] numeros = new int[10] { 1, 2, 3, 4, 5, 6, 7, 8, 9, 0 };
int numero = numeros[0];
Console.WriteLine(numero);
Console.WriteLine("\n");

for (int i = 0; i< numeros.Length; i++)
{
    Console.WriteLine("Iteración número "+ (i + 1) + " - " + numeros[i]);
}
Console.WriteLine("\n");
Console.WriteLine("Arreglo invertido con for");

for (int i = numeros.Length - 1; i >= 0; i--)
{
    Console.WriteLine(numeros[i]);
}

Console.WriteLine("\n");
foreach (int i in numeros) {  
    Console.WriteLine(i); 
}
Console.WriteLine("\n");
Console.WriteLine("Arreglo invertido con foreach");

Array.Reverse(numeros);

foreach (int i in numeros)
{
    Console.WriteLine(i);
}

Console.WriteLine("\n");
Console.WriteLine("LISTA");

List<int> lista = new List<int>() { 1,2,3,4,5,6,7,8};
lista.Add(9);
lista.Add(0);
//lista.Remove(0);
foreach (int n in lista)
{
    Console.WriteLine(n);
}