#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


ui <- fluidPage(
    navbarPage(title = "Crypto Explorer",
               tabPanel("Charts",
                        sidebarLayout(
                            sidebarPanel(
                                # textbox
                                textInput(inputId = "coin",
                                          label = "Enter coin symbol:",
                                          value = "BTC"),
                                # date input
                                dateRangeInput(inputId = "dates",
                                               label = "Prices between:",
                                               start = "2019-01-01")
                            ),
                            # output plots
                            mainPanel(
                                plotOutput(outputId = "priceplot"),
                                plotOutput(outputId = "volplot")
                            )
                        )
               ),
               tabPanel("Top Coins",
                        column(width = 4,
                               # numeric input
                               numericInput(inputId = "num",
                                            label = "Number of coins",
                                            value = "5",
                                            min = "1")
                        ),
                        column(width = 8,
                               # output data table
                               tableOutput(outputId = "top")
                        )
               )
    )
) # close fluidPage

server <- function(input, output) {
    # pull historical data and plot price
    output$priceplot <- renderPlot({
        data <- crypto_history(coin = input$coin,
                               start_date = gsub("-", "", input$dates[1], fixed = T),
                               end_date = gsub("-", "", input$dates[2], fixed = T))
        data %>%
            ggplot(mapping = aes(x = date, y = close)) +
            geom_line(color = "#428BCA", size = 1.5) +
            labs(x = "Date", y = "Closing price ($)",
                 title = paste("Price of ", input$coin, sep = "")) +
            theme_custom()
    })
    # pull historical data and plot volume
    output$volplot <- renderPlot({
        data <- crypto_history(coin = input$coin,
                               start_date = gsub("-", "", input$dates[1], fixed = T),
                               end_date = gsub("-", "", input$dates[2], fixed = T))
        data %>%
            ggplot(mapping = aes(x = date, y = volume / 10 ^ 6)) +
            geom_line(color = "#a3c586", size = 1.5) +
            labs(x = "Date", y = "Volume (in millions)") +
            theme_custom()
    })
    # rest of server function...
    # pull market cap data and output top coins
    output$top <- renderTable({
        crypto_prices() %>%
            select(Rank = (rank), Symbol = symbol, Name = name,
                   Price = price_usd, Cap = market_cap_usd) %>%
            mutate(Rank = as.factor(Rank)) %>%
            slice(1:input$num)
    })
} # brace to close server function

shinyApp(ui = ui, server = server)
