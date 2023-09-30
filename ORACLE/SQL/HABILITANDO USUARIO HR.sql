/* Link: http://blog.hadsonpar.com/2016/04/habilitar-usuario-hr-oracle.html
   Habilitar Usuario HR Oracle 
   Al realizar la primera instalación del Oracle, el usuario HR por defecto está bloqueado y por ende no podemos loguearnos como dicho usuario, lo que debe hacer son los siguiente pasos, aplicables para Linux o Windows.

   1. Conectarse como usuario system o sysdba + contraseña haciendo uso del comando connect. 
   Usuario: system
   Password: xxxx 
   
   2. Hacer uso  del comando alter user hr account unlock desbloqueamos la cuenta. */
   alter user hr account unlock;
   
/* 3. Escribimos el comando alter user HR identified by hr; con esto estamos diciendo que la contraseña será hr. */
   alter user HR identified by hr;