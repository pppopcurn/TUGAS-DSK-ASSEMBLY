.model small
.stack 100h
.data
    BarisBaru db 10,13,'$'
    penyimpanan db 100 dup("$")      
    info db 10,13,'$'
    namaa  db 10,13,' Nama :$'
    nonik   db 10,13,' NIK  :$'
    kartu   db 10,13,' Nomor Kartu :$'          
    bpjs    db 10,13,' Kelas Rawat :$'
    nama db 10,13,'Masukkan Nama : $'
    nik db 10,13,'Masukkan NIK : $'     
    nomor_kartu db 10,13,'Masukkan Nomor Kartu : $' 
    kelas_rawat db 10,13,'Masukkan Kelas Rawat : $'
    
    
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov si, offset penyimpanan
    mov dx, offset nama
    mov ah, 9
    int 21h
  
nikCheck:
    mov ah,10
    int 21h
    cmp al, 13
    je nikShow
    mov [si], al
    inc si
    jmp nikCheck
        
nikShow:
    mov al, 32
    mov [si], al
    inc si                
        
    mov dx, offset BarisBaru
    mov ah, 9
    int 21h 
    
    mov dx, offset nik
    mov ah, 9
    int 21h  
    jmp nikSimpan
    
nikSimpan:
    mov ah, 10
    int 21h
    cmp al, 13
    je nomorkartuCheck
    mov [si], al
    inc si
    jmp nikSimpan 
    
nomorkartuCheck:
    je nomorkartuShow
    mov [si], al
    inc si
    jmp nomorkartuCheck
        
nomorkartuShow:
    mov al, 32
    mov [si], al
    inc si                
        
    mov dx, offset BarisBaru
    mov ah, 9
    int 21h 
    
    mov dx, offset nomor_kartu
    mov ah, 9
    int 21h  
    jmp nomorkartuSimpan
    
nomorkartuSimpan:
    mov ah, 10
    int 21h
    cmp al, 13
    je kelasrawatCheck
    mov [si], al
    inc si
    jmp nomorkartuSimpan  
    

kelasrawatCheck:
    je kelasrawatShow
    mov [si], al
    inc si
    jmp kelasrawatCheck
        
kelasrawatShow:
    mov al, 32
    mov [si], al
    inc si                
        
    mov dx, offset BarisBaru
    mov ah, 9
    int 21h 
    
    mov dx, offset kelas_rawat
    mov ah, 9
    int 21h  
    jmp kelasrawatSimpan
    
kelasrawatSimpan:
    mov ah, 10
    int 21h
    cmp al, 13
    je print
    mov [si], al
    inc si
    jmp kelasrawatSimpan    
    
    
print:
    mov dx, offset info
    mov ah, 9
    int 21h
                
    mov dx, offset BarisBaru
    mov ah, 9
    int 21h
                
    mov dx, offset namaa 
    mov ah, 9
    int 21h    
    
    mov dx, offset nonik 
    mov ah, 9
    int 21h      
          
    mov dx, offset kartu
    mov ah, 9
    int 21h      
    
    mov dx, offset bpjs
    mov ah, 9
    int 21h       
    
    mov dx, offset penyimpanan
    mov ah, 9
    int 21h
    mov ah, 4ch
       
    mov dx, offset BarisBaru
    int 21h   
