*** Variables ***
# Login
${LOGIN_USERNAME}        id=user-name
${LOGIN_PASSWORD}        id=password
${LOGIN_BUTTON}          id=login-button
${ERROR_MESSAGE}         css=.error-message-container

# Produtos
${PRODUCTS_TITLE}        css=.title
${PRODUCT_ITEM}          css=.inventory_item
${PRODUCT_NAME}          css=.inventory_item_name
${ADD_TO_CART_BUTTON}    css=.btn_inventory
${CART_BADGE}            css=.shopping_cart_badge
${CART_LINK}             css=.shopping_cart_link

# Carrinho
${CART_TITLE}            css=.title
${CART_ITEM}             css=.cart_item
${REMOVE_BUTTON}         css=.cart_button
${CHECKOUT_BUTTON}       id=checkout
${CONTINUE_SHOPPING}     id=continue-shopping

# Checkout
${CHECKOUT_FIRST_NAME}   id=first-name
${CHECKOUT_LAST_NAME}    id=last-name
${CHECKOUT_ZIP_CODE}     id=postal-code
${CHECKOUT_CONTINUE}     id=continue
${CHECKOUT_FINISH}       id=finish
${CHECKOUT_CANCEL}       id=cancel

# elementos comuns
${MENU_BUTTON}           id=react-burger-menu-btn
${LOGOUT_LINK}           id=logout_sidebar_link