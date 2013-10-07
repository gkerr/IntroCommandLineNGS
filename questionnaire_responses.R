# read in data
mydata = read.csv("questionnaire_responses.csv", colClass = c("NULL", "integer", "integer", "integer", "integer", "integer", "integer", "integer", "integer", "factor", "factor", "factor", "factor", "integer", "integer", "integer", "integer", "integer", "integer", "integer", "integer", "character", "character", "character", "character"));

cat("==Summary of Questionnaire Responses==\n===Key to Numeric Responses===\n0 = no response, 1 = not at all, 5 = completely\n\n");

for(i in names(mydata)) {
  cat("===");
  cat(gsub("[.]", " ", i));
  cat("===\n");

  myclass = class(mydata[[i]]);

  if(myclass == "integer") {
    # replace undefined values with zeros
    cat("<pre>\n");
    mydata[[i]][is.na(mydata[[i]])] = 0;
    print(as.data.frame(table(mydata[i])));
    cat("</pre>\n");
  }
  else if(myclass == "factor") {
    cat("<pre>\n");
    print(as.data.frame(table(as.character(mydata[[i]]), exclude = c(""), useNA = c("ifany"))));
    cat("</pre>\n");
  }
  else {
    cat("*");
    cat(as.character(mydata[[i]][mydata[[i]] != ""]), sep = "\n*");
    cat("\n");
  }

  cat("\n");
}
