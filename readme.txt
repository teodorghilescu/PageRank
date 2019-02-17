% GHILESCU TEODOR-ANDREI 314CB

Tema 1 MN - PageRank

1.CITIREA DIN FISIER
	Cand se citeste indicele unei pagini si indecsii vecinilor => A(indice, indice_vecin) = 1 si L(i) = L(i) + 1, unde A este matricea de adiacenta initializata cu O(N,N) si L vectorul coloana care memoreaza numarul de link-uri de pe pagina,
	exceptand link-urile catre ea insasi.

2.METODA ITERATIVE
	Algoritmul se implementeaza folosind matricea M (se observa ca j are link catre i
	este echivalent cu A(j,i) = 1). Se folosesc doua matrice de pagerank, una R care este matricea la pasul t si alta Raux care este matricea la pasul t+1.

3.METODA ALGEBRAIC
	Se aplica formula pentru R, iar pentru calcularea inversei lui I - d*M se aplica
	Gram-Schmidt Modificat.
	Descriere GSM: fiind dati vectorii ortogonali u(k) si liniari a(k). Metoda clasica poate fi vazuta drept calculand u(k) ca a(k) - suma proiectiilor lui a(k) pe u(1:k-1). Cea modificata presupune calcularea lui u(k+1) ca u(k) - proiectia lui u(k) pe u(k+1), adica aflarea unui vector u(k+1) ortogonal pe u(k). Implementarea presupune ortogonalizarea unor vectori care se tot modifica fata de cea a unor vectori constanti. Adica clasic a(k) raman aceeasi, iar in GSM se modifica in functie de R(i,i) si qi la pasul i.

4.APARTENENTA-DETERMINAREA LUI a SI b
	Ca functia sa fie continua, inseamna ca lim cand x->val1 din u(x) = 0 sa fie egal cu lim cand x->val1 din u(x) = ax+b. Se obtine ca a*val1 + b = 0, iar analog
	a*val2 + b = 1. De unde rezulta ca a = 1/(val2 - val1) si b = -a*val1.

5.PAGERANK-CITIREA LUI VAL1 SI VAL2
	Din cauza ca val1 si val2 sunt la sfarsit, fisierul trebuie parcurs. Stiind ca val1 si val2 sunt < 1 si toti ceilalti intregi din fisier sunt >= 1, se citeste intr-o variabila toate valorile pana la intalnirea uneia < 1.

6.TESTARE
	Pentru functiile Iterativ si Algebraic am testat apelandu-le in linia de comanda din Octave (ex: Iterativ("graf1", 0.85, 0.001)). Pentru Gram-Schmidt am afisat Q*R
	sa vad daca este A si A * X(=A^-1) sa vad daca este I. Pentru functia PageRank am folosit comanda in Linux "diff" intre fisierul out si ref.