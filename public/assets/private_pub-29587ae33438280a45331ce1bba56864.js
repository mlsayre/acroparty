function buildPrivatePub(doc){var self={connecting:!1,fayeClient:null,fayeCallbacks:[],subscriptions:{},subscriptionObjects:{},subscriptionCallbacks:{},faye:function(e){if(self.fayeClient)e(self.fayeClient);else if(self.fayeCallbacks.push(e),self.subscriptions.server&&!self.connecting){self.connecting=!0;var s=doc.createElement("script");s.type="text/javascript",s.src=self.subscriptions.server+".js",s.onload=self.connectToFaye,doc.documentElement.appendChild(s)}},connectToFaye:function(){self.fayeClient=new Faye.Client(self.subscriptions.server),self.fayeClient.addExtension(self.fayeExtension),Faye.Transport.WebSocket.isUsable=function(e,s,n){n(!1)};for(var e=0;e<self.fayeCallbacks.length;e++)self.fayeCallbacks[e](self.fayeClient)},fayeExtension:{outgoing:function(e,s){if("/meta/subscribe"==e.channel){var n=self.subscriptions[e.subscription];e.ext||(e.ext={}),e.ext.private_pub_signature=n.signature,e.ext.private_pub_timestamp=n.timestamp}s(e)}},sign:function(e){self.subscriptions.server||(self.subscriptions.server=e.server),self.subscriptions[e.channel]=e,self.faye(function(s){var n=s.subscribe(e.channel,self.handleResponse);self.subscriptionObjects[e.channel]=n,e.subscription&&e.subscription(n)})},handleResponse:function(message){message.eval&&eval(message.eval),(callback=self.subscriptionCallbacks[message.channel])&&callback(message.data,message.channel)},subscription:function(e){return self.subscriptionObjects[e]},unsubscribeAll:function(){for(var e in self.subscriptionObjects)self.subscriptionObjects.hasOwnProperty(e)&&self.unsubscribe(e)},unsubscribe:function(e){var s=self.subscription(e);s&&(s.cancel(),delete self.subscriptionObjects[e])},subscribe:function(e,s){self.subscriptionCallbacks[e]=s}};return self}var PrivatePub=buildPrivatePub(document);