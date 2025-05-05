# Pràctica 2 - Arquitectura de Computadors
Realització del codi per a la pràctica d'arquitectura de computadors. El codi ha de realitzar una operació matemàtica, programat en ensamblador del processador MIPS64.

## Instal·lació de Wine en Linux
Per executar WinMIPS64 en Linux, necessitem instal·lar Wine:

### Ubuntu/Debian:
```bash
# Actualitzar els repositoris
sudo apt update

# Instal·lar Wine
sudo apt install wine
```

### Fedora:
```bash
# Activar el repositori Wine
sudo dnf config-manager --add-repo https://dl.winehq.org/wine-builds/fedora/$(rpm -E %fedora)/winehq.repo

# Instal·lar Wine
sudo dnf install winehq-stable
```

### Arch Linux:
```bash
# Instal·lar Wine
sudo pacman -S wine
```

## Com executar els arxius .s amb WinMIPS64

1. **Obrir WinMIPS64**
   ```bash
   wine winmips64.exe
   ```

2. **Carregar l'arxiu**
   - Anar a `File > Load`
   - Seleccionar l'arxiu .s que volem executar

3. **Executar el programa**
   - F3: Executa una instrucció
   - F4: Executa fins al final
   - F5: Executa fins al breakpoint
   - F7: Reinicia la simulació

4. **Veure els resultats**
   - Registres: Finestra de registres
   - Memòria: Finestra de dades
   - Pipeline: Finestra de pipeline

## Notes importants
- Els arxius han d'estar en format text pla (.s)
- Cal seguir l'estructura bàsica:
  ```mips
  .data
      # Variables aquí
  .text
  main:
      # Codi aquí
      halt    # Fi del programa
  ```
- Els registres disponibles són:
  - r0-r31: Registres enters
  - f0-f31: Registres punt flotant

### Possibles problemes amb Wine
Si tens problemes en executar WinMIPS64:
1. Comprova la versió de Wine:
   ```bash
   wine --version
   ```
2. Assegura't que tens els permisos d'execució:
   ```bash
   chmod +x winmips64.exe
   ```
3. Si tens problemes amb les llibreries:
   ```bash
   winetricks vcrun6
   ```
