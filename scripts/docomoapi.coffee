# Description:
#   DOCOMOの雑談APIを利用した雑談
#
# Author:
#   FromAtom

# module.exports = (robot) ->
#   robot.respond /hoge/i, (msg) ->
#     msg.send process.env.DOCOMO_API_KEY

module.exports = (robot) ->
  robot.respond /(\S+)/i, (msg) ->
    DOCOMO_API_KEY = process.env.DOCOMO_API_KEY
    message = msg.match[1]
    url = 'https://api.apigw.smt.docomo.ne.jp/dialogue/v1/dialogue?APIKEY=' + DOCOMO_API_KEY

    request = require('request');
    request.post
      url: url
      json:
        utt: message
      , (err, response, body) ->
        msg.send body.da