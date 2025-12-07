.MODEL SMALL
.STACK 1000h 

.DATA

first_time db 1      ; Flag for initial welcome message
; Welcome message
    welcomeMsg  db        " ----------------------------------------------------------- ", 0dH, 0aH
                db        "|  __          __  _                            _______     |", 0dH, 0aH
                db        "|  \ \        / / | |                          |__   __|    |", 0dH, 0aH
				db        "|   \ \  /\  / /__| | ___ ___  _ __ ___   ___     | | ___   |", 0dH, 0aH
				db        "|    \ \/  \/ / _ \ |/ __/ _ \| `_ ` _ \ / _ \    | |/ _ \  |", 0dH, 0aH
				db        "|     \  /\  /  __/ | (_| (_) | | | | | |  __/    | | (_) | |", 0dH, 0aH
				db        "|      \/  \/ \___|_|\___\___/|_| |_| |_|\___|    |_|\___/  |", 0dH, 0aH
				db        "|                                                           |", 0dH, 0aH
				db        "|     __  __      _____                    _     _ _        |", 0dH, 0aH
				db        "|    |  \/  |    |  __ \                  | |   | ( )       |", 0dH, 0aH
				db        "|    | \  / | ___| |  | | ___  _ __   __ _| | __| |/ ___    |", 0dH, 0aH
				db        "|    | |\/| |/ __| |  | |/ _ \| `_ \ / _` | |/ _` | / __|   |", 0dH, 0aH
				db        "|    | |  | | (__| |__| | (_) | | | | (_| | | (_| | \__ \   |", 0dH, 0aH
				db        "|    |_|  |_|\___|_____/ \___/|_| |_|\__,_|_|\__,_| |___/   |", 0dH, 0aH
				db        "|                                                           |", 0dH, 0aH
				db        " ----------------------------------------------------------- ", 0dH, 0aH
                db        0dH, 0aH, " Press any key to continue...$"
				
    ; ==================== Ordering System Data ====================
    ; ==================== Category Menu UI ====================
    category_header db 13,10, " ----------------------------------------------------- ", 13,10
                    db        "|      _____      _                                   |", 13,10
                    db        "|     / ____|    | |                                  |", 13,10
                    db        "|    | |     __ _| |_ ___  __ _  ___  _ __ _   _      |", 13,10
                    db        "|    | |    / _` | __/ _ \/ _` |/ _ \| `__| | | |     |", 13,10
                    db        "|    | |___| (_| | ||  __/ (_| | (_) | |  | |_| |     |", 13,10
                    db        "|     \_____\__,_|\__\___|\__, |\___/|_|   \__, |     |", 13,10
                    db        "|                          __/ |            __/ |     |", 13,10
                    db        "|                         |___/            |___/      |", 13,10
                    db        " ----------------------------------------------------- ", 13,10
                    db        "|                == Choose a Category ==              |", 13,10
                    db        "|  1. Order Burgers                                   |", 13,10
                    db        "|  2. Order Sides                                     |", 13,10
                    db        "|  3. Order Beverages                                 |", 13,10
                    db        "|  4. View Cart                                       |", 13,10
                    db        "|  5. Payment                                  	      |", 13,10
                    db        "|  6. Exit                                            |", 13,10
                    db        " ----------------------------------------------------- ", 13,10, "$"
    category_prompt db 13,10, " Enter Option (1-6): $"
    category_error db 13,10, " Please enter 1 to 6 only! $"
    selected_option db 13,10, " Selected Option: $"
	
    confirm_prompt db 13,10,'Confirm this item? (Y/N): $'
    confirm_error db 13,10,'Invalid input. Please enter Y or N.$'
	no_items_msg db 13,10,'Your cart is empty. Please add items before payment.',13,10,'Press any key to continue...$'
	
    invalid_choice db 13,10,'Invalid choice! Please try again.',13,10,10,'$'
    addon_prompt db 13,10,'Do you want to add more items? (y/n): $'
    current_category db 0 ; 1=burgers, 2=sides, 3=beverages
    newline db 13,10,'$'
    
    ; Burger items
	 burger_header db 13,10,  " ----------------------------------------------------------------- ", 13,10
                  db         "|  ____                                  __  __                   |", 13,10
                  db         "| |  _ \                                |  \/  |                  |", 13,10
                  db         "| | |_) |_   _ _ __ __ _  ___ _ __ ___  | \  / | ___ _ __  _   _  |", 13,10
                  db         "| |  _ <| | | | `__/ _` |/ _ \ `__/ __| | |\/| |/ _ \ `_ \| | | | |", 13,10
                  db         "| | |_) | |_| | | | (_| |  __/ |  \__ \ | |  | |  __/ | | | |_| | |", 13,10
                  db         "| |____/ \__,_|_|  \__, |\___|_|  |___/ |_|  |_|\___|_| |_|\__,_| |", 13,10
                  db         "|                   __/ |                                         |", 13,10
                  db         "|                  |___/                                          |", 13,10
                  db         " ----------------------------------------------------------------- ", 13,10
                  db         "|                                            _..----.._           |", 13,10
                  db         "|                                          .`     o    `.         |", 13,10
    burger1       db         "|  1 - Chicken Burger      RM9            /   o       o  \        |", 13,10
    burger2       db         "|  2 - Lamb Burger         RM14          |o        o     o|       |", 13,10
    burger3       db         "|  3 - Beef Burger         RM12          /`-.._o     __.-`\       |", 13,10
                  db         "|                                        \      `````     /       |", 13,10
                  db         "|                                        |``--........--``|       |", 13,10
                  db         "|                                         \              /        |", 13,10
                  db         "|                                          ``----------``         |", 13,10
                  db         "| All prices are inclusive of 6% SST.                             |", 13,10
                  db         " ----------------------------------------------------------------- ", 13,10, "$"
    burger_prompt db 'Enter your choice (1-3) or 0 to return to category menu to add item: $'
    burger_selected db 13,10,'You selected: $'
    
    ; Sides items
	sides_header db 13,10,  " ------------------------------------------------------------ ", 13,10
                 db         "|      _____ _     _             __  __                      |", 13,10
                 db         "|     / ____(_)   | |           |  \/  |                     |", 13,10
                 db         "|    | (___  _  __| | ___  ___  | \  / | ___ _ __  _   _     |", 13,10
                 db         "|     \___ \| |/ _` |/ _ \/ __| | |\/| |/ _ \ `_ \| | | |    |", 13,10
                 db         "|     ____) | | (_| |  __/\__ \ | |  | |  __/ | | | |_| |    |", 13,10
                 db         "|    |_____/|_|\__,_|\___||___/ |_|  |_|\___|_| |_|\__,_|    |", 13,10
                 db         "|                                                            |", 13,10
                 db         " ------------------------------------------------------------ ", 13,10
                 db         "|                                       \|\ /| /|_/|//       |", 13,10
    side1        db         "|  1 - French Fries           RM6       |\||-|\||-/|/|       |", 13,10
    side2        db         "|  2 - Chicken Nuggets (6pc)  RM6       |\||-|\||-/|/|       |", 13,10
    side3        db         "|  3 - Apple Pie              RM5        |||\\|/\\ ||        |", 13,10
                 db         "|                                        | `./\_/.` |        |", 13,10
                 db         "|                                        |          |        |", 13,10
                 db         "|                                         `.______.`         |", 13,10
                 db         "| All prices are inclusive of 6% SST.                        |", 13,10
                 db         " ------------------------------------------------------------ ", 13,10, "$"
    sides_prompt db 'Enter your choice (1-3) or 0 to return to category menu to add item: $'
    side_selected db 13,10,'You selected: $'
    
    ; Beverage items
	 beverage_header db 13,10, " ---------------------------------------------------------------------------- ", 13,10
                    db        "|  ____                                             __  __                   |", 13,10
                    db        "| |  _ \                                           |  \/  |                  |", 13,10
                    db        "| | |_) | _____   _____ _ __ __ _  __ _  ___  ___  | \  / | ___ _ __  _   _  |", 13,10
                    db        "| |  _ < / _ \ \ / / _ \ `__/ _` |/ _` |/ _ \/ __| | |\/| |/ _ \ `_ \| | | | |", 13,10
                    db        "| | |_) |  __/\ V /  __/ | | (_| | (_| |  __/\__ \ | |  | |  __/ | | | |_| | |", 13,10
                    db        "| |____/ \___| \_/ \___|_|  \__,_|\__, |\___||___/ |_|  |_|\___|_| |_|\__,_| |", 13,10
                    db        "|                                  __/ |                                     |", 13,10
                    db        "|                                 |___/                                      |", 13,10
                    db        " ---------------------------------------------------------------------------- ", 13,10
                    db        "|                                                 /                          |", 13,10
    bev1            db        "|  1 - Coca-Cola      RM2                      .-/-.                         |", 13,10
    bev2            db        "|  2 - Orange Juice   RM3                      |`-`|                         |", 13,10
    bev3            db        "|  3 - Coffee         RM6                      |   |                         |", 13,10
                    db        "|                                              |   |                         |", 13,10
                    db        "|                                              |___|                         |", 13,10
                    db        "| All prices are inclusive of 6% SST.                                        |", 13,10
                    db        " ---------------------------------------------------------------------------- ", 13,10, "$"
    beverage_prompt db 'Enter your choice (1-3) or 0 to return to category menu to add item: $'
    beverage_selected db 13,10,'You selected: $'
    
 ; Food names and prices (in sen)
    chicken_burger db 'Chicken Burger$' 
    chicken_burger_price dw 900
    lamb_burger db 'Lamb Burger$'  
    lamb_burger_price dw 1400
    beef_burger db 'Beef Burger$' 
    beef_burger_price dw 1200
    french_fries db 'French Fries$'
    french_fries_price dw 600
    chicken_nuggets db 'Chicken Nuggets$' 
    chicken_nuggets_price dw 600
    apple_pie db 'Apple Pie$'
    apple_pie_price dw 500
    coca_cola db 'Coca-Cola$'  
    coca_cola_price dw 200
    orange_juice db 'Orange Juice$'
    orange_juice_price dw 300
    coffee db 'Coffee$' 
    coffee_price dw 600
    
    ; Quantity system
    quantity_prompt db 13,10,'Enter quantity (1-9): $'
    quantity_buffer db 3, ?, 3 dup('$')
    quantity db ?
    
    ; Order tracking
    MAX_ITEMS equ 10
    order_items dw MAX_ITEMS dup(0)   ; Pointers to item names
    order_prices dw MAX_ITEMS dup(0)  ; Prices in sen
    order_quantities db MAX_ITEMS dup(0) ; Quantities
    order_count db 0
    
    ; Input buffers
    input_buffer db 3, 0, 3 dup(?)
    input_buffer_cc db 3, 0, 3 dup(?)
    choice db ?
    addon_choice db ?
    continue_prompt db 13,10,'Press any key to continue to payment...$'
    
; ==================== Order Summary Data ====================

summary_header DB 13,10, "  -----------------------------------------------------------  ", 13,10
                DB        "|     __  __      _____                    _     _ _        |", 0dH, 0aH
				db        "|    |  \/  |    |  __ \                  | |   | ( )       |", 0dH, 0aH
				db        "|    | \  / | ___| |  | | ___  _ __   __ _| | __| |/ ___    |", 0dH, 0aH
				db        "|    | |\/| |/ __| |  | |/ _ \| `_ \ / _` | |/ _` | / __|   |", 0dH, 0aH
				db        "|    | |  | | (__| |__| | (_) | | | | (_| | | (_| | \__ \   |", 0dH, 0aH
				db        "|    |_|  |_|\___|_____/ \___/|_| |_|\__,_|_|\__,_| |___/   |", 0dH, 0aH
                DB        "|              ____  _____  _____  ______ _____             |", 0dH, 0aH
                DB        "|             / __ \|  __ \|  __ \|  ____|  __ \            |", 0dH, 0aH
                DB        "|            | |  | | |__) | |  | | |__  | |__) |           |", 0dH, 0aH
                DB        "|            | |  | |  _  /| |  | |  __| |  _  /            |", 0dH, 0aH
                DB        "|            | |__| | | \ \| |__| | |____| | \ \            |", 0dH, 0aH
                DB        "|             \____/|_|  \_\_____/|______|_|  \_\           |", 0dH, 0aH  
                DB        "|                                                           |", 0dH, 0aH
                DB        "|---------------------------------------------------------- |", 13,10,"$"

itemQty          db ' x ', '$'
hyphen_rm        db ' - RM$'  

totalMsg         db 13,10,'===============================',13,10
                 db 'Total:       RM$'
thankyouMsg      db 13,10,'Thank you for your order!',13,10,'$'
    
    ; Variables for calculations
    total dw 0
    
    ; Buffer for number conversion
    numBuffer db 10 DUP ('$')
    
    ; ==================== Payment System Data ====================
	msgMenu DB 13,10, " ----------------------------------------------- ", 13,10
                       DB        "|   _____                                 _     |", 13,10
                       DB        "|  |  __ \                               | |    |", 13,10
                       DB        "|  | |__) |_ _ _   _ _ __ ___   ___ _ __ | |_   |", 13,10
                       DB        "|  |  ___/ _` | | | | `_ ` _ \ / _ \ `_ \| __|  |", 13,10
                       DB        "|  | |  | (_| | |_| | | | | | |  __/ | | | |_   |", 13,10
                       DB        "|  |_|   \__,_|\__, |_| |_| |_|\___|_| |_|\__|  |", 13,10
                       DB        "|               __/ |                           |", 13,10
                       DB        "|     __  __   |___/  _               _         |", 13,10
                       DB        "|    |  \/  |    | | | |             | |        |", 13,10
                       DB        "|    | \  / | ___| |_| |__   ___   __| |___     |", 13,10
                       DB        "|    | |\/| |/ _ \ __| `_ \ / _ \ / _` / __|    |", 13,10
                       DB        "|    | |  | |  __/ |_| | | | (_) | (_| \__ \    |", 13,10
                       DB        "|    |_|  |_|\___|\__|_| |_|\___/ \__,_|___/    |", 13,10
                       DB        "|                                               |", 13,10
                       DB        " ----------------------------------------------- ", 13,10
                       DB        "|                                               |", 13,10
                       DB        "| 1. Cash                                       |", 13,10
                       DB        "| 2. Credit/debit Cards                         |", 13,10
                       DB        "| 3. E-Wallet                                   |", 13,10
                       DB        "|                                               |", 13,10
                       DB        " ----------------------------------------------- ", 13,10, "$"
    msgPrompt db 13,10,'Please select a payment option: $'
    msgCash db 13,10,'You selected: Cash',13,10,'$'
    msgCard db 13,10,'You selected: Credit/debit Cards',13,10,'$'
    msgEwallet db 13,10,'You selected: E-wallet',13,10,'$'
    msgError db 13,10,'Invalid selection!',13,10,'$'
    cash_proceed_msg db 13,10,'Please proceed to pay at the counter.',13,10,'$'
    processing_msg   db 13,10,'Processing payment$'
	proccc_msg       db '...$'
	processing_msg_c db 'Payment Complete !',13,10,'$'
    continue_order_msg db 13,10,'Do you want to continue ordering? (Y/N): $'
	confirm_msg db 13,10, 'Your order has been confirmed.$'
	cancel_msg db 13,10, 'Your order has been cancelled.$'
	
.CODE
main proc
    mov ax, @data
    mov ds, ax
	
    ; Clear screen first
    mov ax, 0003h
    int 10h
	
	mov ah, 09h
	lea dx, welcomeMsg
	int 21h
	
	mov ah, 08h
    int 21h
    
main_menu:

    ; Clear screen
    mov ax, 0003h
    int 10h

    ; Display category menu
    mov ah, 09h
    lea dx, category_header
    int 21h

prompt_category_input:
    ; Display prompt
    mov ah, 09h
    lea dx, category_prompt
    int 21h

    ; Get user input
    mov ah, 01h
    int 21h
    mov [choice], al

    ; Process input
    cmp al, '1'
    je burgers_selected
    cmp al, '2'
    je sides_selected
    cmp al, '3'
    je beverages_selected
    cmp al, '4'
    je view_cart_selected
    cmp al, '5'
    je payment_selected
    cmp al, '6'
    jne skip_exit
	jmp exit_program
	skip_exit:

    ; Invalid input
    mov ah, 09h
    lea dx, category_error
    int 21h
    
    mov ah, 08h
    int 21h
    
    jmp prompt_category_input


burgers_selected:
    mov [current_category], 1
    call burgers_menu
    jmp main_menu
    
sides_selected:
    mov [current_category], 2
    call sides_menu
    jmp main_menu
    
beverages_selected:
    mov [current_category], 3
    call beverages_menu
    jmp main_menu

view_cart_selected:
    ; Clear screen
    mov ax, 0003h
    int 10h
    
    ; Check if cart is empty
    cmp [order_count], 0
    je empty_cart
    
    ; Show summary with items
    call show_summary
    
    ; Add "Press any key to continue" prompt
    mov ah, 09h
    lea dx, continue_prompt  ; 
    int 21h
    
    ; Wait for key press
    mov ah, 08h
    int 21h
    
    ; Return to main menu
    jmp payment_menu

empty_cart:
    ; Show empty cart message
    mov ah, 09h
    lea dx, no_items_msg
    int 21h
    
    ; Wait for key press
    mov ah, 08h
    int 21h
    
    ; Return to main menu
    jmp main_menu

payment_selected:
    ; Check if there are any items in the order
    cmp [order_count], 0
    je no_items_for_payment
    
    ; If items exist, proceed to payment
    call show_summary
    call payment_menu
    jmp main_menu

no_items_for_payment:
    ; Show message and return to menu
    mov ah, 09h
    lea dx, no_items_msg
    int 21h
    
    ; Wait for key press
    mov ah, 08h
    int 21h
    
    ; Return to main menu
    jmp main_menu
	
done_ordering:
    ; Clear screen first (optional)
    mov ax, 0003h  ; Clear screen using BIOS interrupt
    int 10h
    
    ; Show summary with proper formatting
    call show_summary
    
    ; Wait for user to see summary
    mov ah, 09h
    lea dx, continue_prompt
    int 21h
    
    ; Wait for key press
    mov ah, 01h
    int 21h
    
    ; Then proceed to payment
    call payment_menu
    jmp exit_program
    
exit_program:
    mov ah, 09h
    lea dx, thankyouMsg
    int 21h
    
    mov ah, 4Ch
    int 21h
main endp

; ==================== Ordering System Functions ====================

; --------------------------
; Function to get quantity
; --------------------------
get_quantity proc
    push ax
    push bx
    push cx
    push dx
    push si
    
quantity_retry:
    ; Display prompt
    mov ah, 09h
    lea dx, quantity_prompt
    int 21h
    
    ; Get buffered input
    mov ah, 0Ah
    lea dx, quantity_buffer
    int 21h
    
	; Get actual character from buffer
    ; In buffer: byte 0 = max length, byte 1 = actual length, bytes 2+ = characters
    mov si, offset quantity_buffer
    mov al, [si+2]        ; Get first character entered
    
    ; Validate input (1-9)
    cmp al, '1'
    jb quantity_invalid
    cmp al, '9'
    ja quantity_invalid
	
    ; Convert ASCII to numeric value
    sub al, '0'
    mov [quantity], al
    
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
    
quantity_invalid:
    ; Show error message
    mov ah, 09h
    lea dx, invalid_choice
    int 21h
    
    ; Wait for key press
    mov ah, 08h
    int 21h
    
    ; Try again
    jmp quantity_retry
get_quantity endp


; --------------------------
; Confirm Item Subroutine
; Returns: Carry Flag = 1 (Y) or 0 (N)
; --------------------------
confirm_item proc
confirmation_loop:
    mov ah, 09h
    lea dx, confirm_prompt
    int 21h
    
    ; Get user input
    mov ah, 01h
    int 21h
    
    ; Check for Y/y
    cmp al, 'Y'
    je confirmed
    cmp al, 'y'
    je confirmed
    
    ; Check for N/n
    cmp al, 'N'
    je not_confirmed
    cmp al, 'n'
    je not_confirmed
    
    ; Invalid input
    mov ah, 09h
    lea dx, confirm_error
    int 21h
    jmp confirmation_loop

confirmed:
    stc    ; Set carry flag to indicate confirmation
	mov ah, 09h
    lea dx, confirm_msg
    int 21h
    ret

not_confirmed:
    clc    ; Clear carry flag to skip adding
	mov ah, 09h
    lea dx, cancel_msg
    int 21h 
    ret
confirm_item endp

; --------------------------
; Add item to order
; Input: SI = pointer to item name
;        BX = item price
;        AL = quantity
; --------------------------
add_to_order proc
    push ax
    push bx
    push cx
    push si
    push di
    
    ; Check if we have space in the order
    mov cl, [order_count]
    cmp cl, MAX_ITEMS
    jae order_full
    
    ; Add item to order
    mov di, offset order_items
    mov ch, 0
    add di, cx
    add di, cx ; Multiply by 2 (word size)
    mov [di], si ; Store pointer to item name
    
    mov di, offset order_prices
    add di, cx
    add di, cx
    mov [di], bx ; Store price
    
    mov di, offset order_quantities
    add di, cx
    mov [di], al ; Store quantity
    
    ; Increment order count
    inc [order_count]
    
order_full:
    pop di
    pop si
    pop cx
    pop bx
    pop ax
    ret
add_to_order endp

; --------------------------
; Burgers menu with quantity
; --------------------------
; --------------------------
burgers_menu proc
burger_start:
    ; Clear screen
    mov ax, 0003h
    int 10h

    ; Set cursor to top-left corner
    mov ah, 02h
    mov bh, 0
    mov dh, 0
    mov dl, 0
    int 10h


    ; Display burger menu (header includes all items)
    mov ah, 09h
    lea dx, burger_header
    int 21h

    ; Prompt for choice
    lea dx, burger_prompt
    int 21h
    
    ; Get user input
    mov ah, 01h
    int 21h
    mov [choice], al
    
    ; Check if user wants to go back (0)
    cmp al, '0'
	jne continue_burger
    jmp burgers_done
	
continue_burger:
    ; Validate input
    cmp al, '1'
    jb invalid_burger
    cmp al, '3'
    ja invalid_burger
    
    ; Display selection on new line
    mov ah, 09h
    lea dx, burger_selected
    int 21h
    
    cmp [choice], '1'
    jne not_burger1
    lea dx, chicken_burger
    int 21h
    
    ; Get quantity
    call get_quantity

    ; Confirm before adding
    call confirm_item
    jnc skip_add_burger   ; if not confirmed (CF=0), skip
    
    ; Add to order if confirmed
    mov si, offset chicken_burger
    mov bx, [chicken_burger_price]
    mov al, [quantity]
    call add_to_order
    
skip_add_burger:
    jmp burger_addon
    
not_burger1:
    cmp [choice], '2'
    jne burger3_selected
    lea dx, lamb_burger
    int 21h
    
    ; Get quantity
    call get_quantity
    
    ; Confirm before adding
    call confirm_item
    jnc skip_add_burger   ; if not confirmed (CF=0), skip
	
    ; Add to order
    mov si, offset lamb_burger
    mov bx, [lamb_burger_price]
    mov al, [quantity]
    call add_to_order
    
    jmp burger_addon
    
burger3_selected:
    lea dx, beef_burger
    int 21h
    
    ; Get quantity
    call get_quantity
    
	; Confirm before adding
    call confirm_item
    jnc skip_add_burger   ; if not confirmed (CF=0), skip
	
    ; Add to order
    mov si, offset beef_burger
    mov bx, [beef_burger_price]
    mov al, [quantity]
    call add_to_order
    
burger_addon:
    call handle_addon
    jmp burger_start
    
invalid_burger:
    mov ah, 09h
    lea dx, invalid_choice
    int 21h
	
	; Wait for key press
    mov ah, 08h
    int 21h
	
    jmp burger_start
    
burgers_done:
    ret
burgers_menu endp

; --------------------------
; Sides menu with quantity
; --------------------------
sides_menu proc
side_start:
    ; Clear screen
    mov ax, 0003h
    int 10h

    ; Set cursor to top-left corner
    mov ah, 02h
    mov bh, 0
    mov dh, 0
    mov dl, 0
    int 10h

    ; Display sides menu
    mov ah, 09h
    lea dx, sides_header
    int 21h
 
    ; Prompt for choice
    lea dx, sides_prompt
    int 21h
    
    ; Get user input
    mov ah, 01h
    int 21h
    mov [choice], al
    
    ; Check if user wants to go back (0)
    cmp al, '0'
	jne continue_sides
    jmp sides_done
    
continue_sides:
    ; Validate input
    cmp al, '1'
    jb invalid_side
    cmp al, '3'
    ja invalid_side
    
    ; Display selection on new line
    mov ah, 09h
    lea dx, side_selected
    int 21h
    
    cmp [choice], '1'
    jne not_side1
    lea dx, french_fries
    int 21h
    
    ; Get quantity
    call get_quantity
    
    ; Confirm before adding
    call confirm_item
    jnc skip_add_side   ; if not confirmed (CF=0), skip
    
    ; Add to order if confirmed
    mov si, offset french_fries
    mov bx, [french_fries_price]
    mov al, [quantity]
    call add_to_order
    
skip_add_side:
    jmp side_addon
    
not_side1:
    cmp [choice], '2'
    jne side3_selected
    lea dx, chicken_nuggets
    int 21h
    
    ; Get quantity
    call get_quantity
    
	; Confirm before adding
    call confirm_item
    jnc skip_add_side   ; if not confirmed (CF=0), skip
	
    ; Add to order
    mov si, offset chicken_nuggets
    mov bx, [chicken_nuggets_price]
    mov al, [quantity]
    call add_to_order
    
    jmp side_addon
    
side3_selected:
    lea dx, apple_pie
    int 21h
    
    ; Get quantity
    call get_quantity
    
	; Confirm before adding
    call confirm_item
    jnc skip_add_side   ; if not confirmed (CF=0), skip
	
    ; Add to order
    mov si, offset apple_pie
    mov bx, [apple_pie_price]
    mov al, [quantity]
    call add_to_order
    
side_addon:
    call handle_addon
    jmp side_start
    
invalid_side:
    mov ah, 09h
    lea dx, invalid_choice
    int 21h
	
	; Wait for key press
    mov ah, 08h
    int 21h
	
    jmp side_start
    
sides_done:
    ret
sides_menu endp

; --------------------------
; Beverages menu with quantity
; --------------------------
beverages_menu proc
bev_start:
    ; Clear screen
    mov ax, 0003h
    int 10h

    ; Set cursor to top-left corner
    mov ah, 02h
    mov bh, 0
    mov dh, 0
    mov dl, 0
    int 10h

    ; Display beverages menu
    mov ah, 09h
    lea dx, beverage_header
    int 21h
    
    ; Prompt for choice
    lea dx, beverage_prompt
    int 21h
    
    ; Get user input
    mov ah, 01h
    int 21h
    mov [choice], al
    
    ; Check if user wants to go back (0)
    cmp al, '0'
	jne continue_beverages
    jmp beverages_done
    
continue_beverages:
    ; Validate input
    cmp al, '1'
    jb invalid_beverage
    cmp al, '3'
    ja invalid_beverage
    
    ; Display selection on new line
    mov ah, 09h
    lea dx, beverage_selected
    int 21h
    
    cmp [choice], '1'
    jne not_bev1
    lea dx, coca_cola
    int 21h
    
       ; Get quantity
    call get_quantity
    
    ; Confirm before adding
    call confirm_item
    jnc skip_add_bev   ; if not confirmed (CF=0), skip
    
    ; Add to order if confirmed
    mov si, offset coca_cola
    mov bx, [coca_cola_price]
    mov al, [quantity]
    call add_to_order
    
skip_add_bev:
    jmp beverage_addon
    
not_bev1:
    cmp [choice], '2'
    jne bev3_selected
    lea dx, orange_juice
    int 21h
    
    ; Get quantity
    call get_quantity
    
	; Confirm before adding
    call confirm_item
    jnc skip_add_bev   ; if not confirmed (CF=0), skip
	
    ; Add to order
    mov si, offset orange_juice
    mov bx, [orange_juice_price]
    mov al, [quantity]
    call add_to_order
    
    jmp beverage_addon
    
bev3_selected:
    lea dx, coffee
    int 21h
    
    ; Get quantity
    call get_quantity
    
	; Confirm before adding
    call confirm_item
    jnc skip_add_bev   ; if not confirmed (CF=0), skip
	
    ; Add to order
    mov si, offset coffee
    mov bx, [coffee_price]
    mov al, [quantity]
    call add_to_order
    
beverage_addon:
    call handle_addon
    jmp bev_start
    
invalid_beverage:
    mov ah, 09h
    lea dx, invalid_choice
    int 21h
	
	; Wait for key press
    mov ah, 08h
    int 21h
	
    jmp bev_start
    
beverages_done:
    ret
beverages_menu endp

; --------------------------
; Handle add-on items
; --------------------------
handle_addon proc
addon_loop:
    ; Add extra newline before prompt
    mov ah, 09h
    lea dx, newline
    int 21h
    
    ; Ask if user wants to add on
    mov ah, 09h
    lea dx, addon_prompt
    int 21h
    
	; Get buffered input
    mov ah, 0Ah
    lea dx, input_buffer
    int 21h
	
    ; Check if input is empty (just Enter)
    mov si, offset input_buffer
    inc si                    ; Point to actual length byte
    cmp byte ptr [si], 0      ; Check actual input length
    je invalid_input_handler  ; If empty, handle as invalid
    
    ; Check first character entered
    inc si                    ; Point to first character
    mov al, [si]              ; Get first character
	
    ; Process addon choice
    cmp al, 'y'
    je return_to_category
    cmp al, 'Y'
    je return_to_category
	
	cmp al, 'N'
    je order_done
    cmp al, 'n'
    je order_done
	
	; If we get here, input is not Y, y, N, or n
    jmp invalid_input_handler
	
invalid_input_handler:
	; Invalid input
    mov ah, 09h
    lea dx, confirm_error
    int 21h
    jmp addon_loop
	
return_to_category:
    cmp [current_category], 1
    je return_to_burgers
    cmp [current_category], 2
    je return_to_sides
    jmp return_to_beverages

return_to_burgers:
    call burgers_menu  ; <-- Already clears screen
    jmp main_menu      ; Return to main menu after exiting burgers

return_to_sides:
    call sides_menu    ; <-- Already clears screen
    jmp main_menu

return_to_beverages:
    call beverages_menu ; <-- Already clears screen
    jmp main_menu

order_done:
	jmp done_ordering
handle_addon endp



; ==================== Order Summary Functions ====================

show_summary proc
   
    push ax
    push bx
    push cx
    push dx
    push si
    
    ; Clear screen
    mov ax, 0003h
    int 10h
    
    ; Display summary header
    mov ah, 09h
    lea dx, summary_header
    int 21h
    
    ; Initialize total to 0
    mov [total], 0
    
    ; Display each ordered item
    mov cl, [order_count]
    mov ch, 0
    mov si, 0
    
display_order_loop:
    cmp si, cx
    jge display_total
    
    ; Get item name pointer
    mov bx, offset order_items
    add bx, si
    add bx, si
    mov dx, [bx]      ; DX = item name pointer
    
    ; Display item name (no newline)
    mov ah, 09h
    int 21h
    
    ; Display " x "
    mov ah, 09h
    lea dx, itemQty
    int 21h
    
    ; Display quantity
    mov bx, offset order_quantities
    add bx, si
    mov dl, [bx]
    add dl, '0'
    mov ah, 02h
    int 21h
    
    ; Display " - RM"
    mov ah, 09h
    lea dx, hyphen_rm
    int 21h
    
    ; Calculate subtotal (price * quantity)
    mov bx, offset order_prices
    add bx, si
    add bx, si
    mov ax, [bx]           ; AX = price in sen
    mov bx, offset order_quantities
    add bx, si
    mov bl, [bx]           ; BL = quantity
    mov bh, 0
    mul bx                 ; AX = subtotal_sen
    
    ; Add to total
    add [total], ax
    
    ; Convert subtotal to RM and display
    mov bx, 100
    xor dx, dx
    div bx                 ; AX = RM value
    call DisplayNumber
    
    ; New line after each item
    mov ah, 09h
    lea dx, newline
    int 21h
    
    inc si
    jmp display_order_loop
    
display_total:
    ; Display total
    mov ah, 09h
    lea dx, totalMsg
    int 21h
    
    ; Convert total from sen to RM
    mov ax, [total]
    mov bx, 100
    xor dx, dx
    div bx                 ; AX = total in RM
    call DisplayNumber
    
    ; Display thank you message
    mov ah, 09h
    lea dx, thankyouMsg
    int 21h
    
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
show_summary endp

; Display number in AX
DisplayNumber PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    
    XOR CX, CX  ; CX will count digits
    MOV BX, 10  ; Divisor
    
    ; Special case for zero
    TEST AX, AX
    JNZ ConvertLoop
    
    MOV DL, '0'
    MOV AH, 02h
    INT 21h
    JMP EndDisplayNumber
    
ConvertLoop:
    XOR DX, DX
    DIV BX          ; AX = AX / 10, DX = remainder
    PUSH DX         ; Save remainder
    INC CX          ; Count digits
    TEST AX, AX     ; Check if quotient is zero
    JNZ ConvertLoop
    
DisplayLoop:
    POP DX          ; Get digit
    ADD DL, '0'     ; Convert to ASCII
    MOV AH, 02h
    INT 21h
    LOOP DisplayLoop
    
EndDisplayNumber:
    POP DX
    POP CX
    POP BX
    POP AX
    RET
DisplayNumber ENDP

; ==================== Payment System Functions ====================
payment_menu proc

payment_start:
    ; Clear screen first
    mov ax, 0003h
    int 10h
    
    ; Display payment method menu
    mov ah, 09h
    lea dx, msgMenu
    int 21h
    
    ; Display prompt
    mov ah, 09h
    lea dx, msgPrompt
    int 21h
    
    ; Get user input
    mov ah, 01h
    int 21h
    
    ; Process selection
    cmp al, '1'
    je cash_selected
    cmp al, '2'
    je card_selected
    cmp al, '3'
    jmp ewallet_selected
    
    ; Invalid selection
    mov ah, 09h
    lea dx, msgError
    int 21h
    jmp payment_start

cash_selected:
    mov ah, 09h
    lea dx, msgCash
    int 21h
    lea dx, cash_proceed_msg
    int 21h
    jmp ask_continue

card_selected:
    mov ah, 09h
    lea dx, msgCard
    int 21h
    lea dx, processing_msg
    int 21h
    
	; 0.4-second delay (400 milliseconds)
    mov cx, 0006h    ; High word of delay count
    mov dx, 1A80h    ; Low word of delay count
    mov ah, 86h      ; BIOS wait function
    int 15h
    
	mov ah, 09h
	lea dx, proccc_msg
    int 21h
	
	; 0.4-second delay (400 milliseconds)
    mov cx, 0006h    ; High word of delay count
    mov dx, 1A80h    ; Low word of delay count
    mov ah, 86h      ; BIOS wait function
    int 15h
    
	mov ah, 09h
	lea dx, proccc_msg
    int 21h

	; 0.4-second delay (400 milliseconds)
    mov cx, 0006h    ; High word of delay count
    mov dx, 1A80h    ; Low word of delay count
    mov ah, 86h      ; BIOS wait function
    int 15h
    
	mov ah, 09h
	lea dx, proccc_msg
    int 21h
	
	; 0.4-second delay (400 milliseconds)
    mov cx, 0006h    ; High word of delay count
    mov dx, 1A80h    ; Low word of delay count
    mov ah, 86h      ; BIOS wait function
    int 15h
    
	mov ah, 09h
	lea dx, proccc_msg
    int 21h
	
	; 0.4-second delay (400 milliseconds)
    mov cx, 0006h    ; High word of delay count
    mov dx, 1A80h    ; Low word of delay count
    mov ah, 86h      ; BIOS wait function
    int 15h
    
	mov ah, 09h
	lea dx, proccc_msg
    int 21h
	
	; 0.4-second delay (400 milliseconds)
    mov cx, 0006h    ; High word of delay count
    mov dx, 1A80h    ; Low word of delay count
    mov ah, 86h      ; BIOS wait function
    int 15h
    
	mov ah, 09h
	lea dx, proccc_msg
    int 21h
	
	mov ah, 09h
	lea dx, processing_msg_c
    int 21h
	
    jmp ask_continue

ewallet_selected:
    mov ah, 09h
    lea dx, msgEwallet
    int 21h
    lea dx, processing_msg
    int 21h
    
    ; 0.4-second delay (400 milliseconds)
    mov cx, 0006h    ; High word of delay count
    mov dx, 1A80h    ; Low word of delay count
    mov ah, 86h      ; BIOS wait function
    int 15h
    
	mov ah, 09h
	lea dx, proccc_msg
    int 21h
	
	; 0.4-second delay (400 milliseconds)
    mov cx, 0006h    ; High word of delay count
    mov dx, 1A80h    ; Low word of delay count
    mov ah, 86h      ; BIOS wait function
    int 15h
    
	mov ah, 09h
	lea dx, proccc_msg
    int 21h

	; 0.4-second delay (400 milliseconds)
    mov cx, 0006h    ; High word of delay count
    mov dx, 1A80h    ; Low word of delay count
    mov ah, 86h      ; BIOS wait function
    int 15h
    
	mov ah, 09h
	lea dx, proccc_msg
    int 21h
	
	; 0.4-second delay (400 milliseconds)
    mov cx, 0006h    ; High word of delay count
    mov dx, 1A80h    ; Low word of delay count
    mov ah, 86h      ; BIOS wait function
    int 15h
    
	mov ah, 09h
	lea dx, proccc_msg
    int 21h
	
	; 0.4-second delay (400 milliseconds)
    mov cx, 0006h    ; High word of delay count
    mov dx, 1A80h    ; Low word of delay count
    mov ah, 86h      ; BIOS wait function
    int 15h
    
	mov ah, 09h
	lea dx, proccc_msg
    int 21h
	
	; 0.4-second delay (400 milliseconds)
    mov cx, 0006h    ; High word of delay count
    mov dx, 1A80h    ; Low word of delay count
    mov ah, 86h      ; BIOS wait function
    int 15h
    
	mov ah, 09h
	lea dx, proccc_msg
    int 21h
	
	mov ah, 09h
	lea dx, processing_msg_c
    int 21h
	
ask_continue:
    ; Ask if user wants to continue ordering
    mov ah, 09h
    lea dx, continue_order_msg
    int 21h
    
	; Get buffered input
    mov ah, 0Ah
    lea dx, input_buffer_cc
    int 21h
	
    ; Check if input is empty (just Enter)
    mov si, offset input_buffer_cc
    inc si                    ; Point to actual length byte
    cmp byte ptr [si], 0      ; Check actual input length
    je invalid_input_cc  ; If empty, handle as invalid
    
    ; Check first character entered
    inc si                    ; Point to first character
    mov al, [si]              ; Get first character
	
    ; Process response
    cmp al, 'y'
    je continue_ordering
    cmp al, 'Y'
    je continue_ordering
	
	; Process response
    cmp al, 'n'
    je payment_done
    cmp al, 'N'
    je payment_done

	; If we get here, input is not Y, y, N, or n
    jmp invalid_input_cc
	
invalid_input_cc:
	; Invalid input
    mov ah, 09h
    lea dx, confirm_error
    int 21h
    jmp ask_continue 

continue_ordering:
    ; Clear the current order
    mov [order_count], 0
    mov [total], 0
    
    ; Return to main menu
    jmp main_menu
	
payment_done:
    ret
payment_menu endp

; --------------------------
; Update exact amount message with current total
; --------------------------
update_exact_amount proc
    push ax
    push bx
    push cx
    push dx
    push si
    
    ; Convert total to RM (total_sen / 100)
    mov ax, [total]
    mov bx, 100
    xor dx, dx
    div bx          ; AX = RM
    
    
    ; Add '$' terminator to truncate ".00"
    mov byte ptr [si], '$'
    
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
update_exact_amount endp


; --------------------------
; Convert AX to string at SI
; --------------------------
number_to_string proc
    push ax
    push bx
    push cx
    push dx
    
    mov bx, 10
    xor cx, cx
    
    ; Handle zero case
    test ax, ax
    jnz .divide_loop
    mov byte ptr [si], '0'
    inc si
	
.divide_loop:
    xor dx, dx
    div bx
    add dl, '0'
    push dx
    inc cx
    test ax, ax
    jnz .divide_loop
    
.store_loop:
    pop dx
    mov [si], dl
    inc si
    loop .store_loop
    
    pop dx
    pop cx
    pop bx
    pop ax
    ret
number_to_string endp


end main