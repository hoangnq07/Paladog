package
{
   import com.fazecat.web.paladog.Drawing;
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.CSSCondition;
   import mx.styles.CSSSelector;
   import mx.styles.CSSStyleDeclaration;
   import spark.components.Application;
   
   use namespace mx_internal;
   
   public class PaladogWeb extends Application
   {
      
      private static var _skinParts:Object = {
         "contentGroup":false,
         "controlBarGroup":false
      };
      
      private var _3091780draw:Drawing;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _PaladogWeb_StylesInit_done:Boolean = false;
      
      public function PaladogWeb()
      {
         super();
         mx_internal::_document = this;
         this.width = 761;
         this.height = 570;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._PaladogWeb_Array1_c);
         this.addEventListener("creationComplete",this.___PaladogWeb_Application1_creationComplete);
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
         mx_internal::_PaladogWeb_StylesInit();
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      public function initApp() : void
      {
         this.draw.initApp();
      }
      
      private function _PaladogWeb_Array1_c() : Array
      {
         return [this._PaladogWeb_Drawing1_i()];
      }
      
      private function _PaladogWeb_Drawing1_i() : Drawing
      {
         var _loc1_:Drawing = new Drawing();
         _loc1_.id = "draw";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.draw = _loc1_;
         BindingManager.executeBindings(this,"draw",this.draw);
         return _loc1_;
      }
      
      public function ___PaladogWeb_Application1_creationComplete(param1:FlexEvent) : void
      {
         this.initApp();
      }
      
      mx_internal function _PaladogWeb_StylesInit() : void
      {
         var _loc1_:CSSStyleDeclaration = null;
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         var _loc4_:CSSCondition = null;
         var _loc5_:CSSSelector = null;
         if(mx_internal::_PaladogWeb_StylesInit_done)
         {
            return;
         }
         mx_internal::_PaladogWeb_StylesInit_done = true;
         styleManager.initProtoChainRoots();
      }
      
      [Bindable(event="propertyChange")]
      public function get draw() : Drawing
      {
         return this._3091780draw;
      }
      
      public function set draw(param1:Drawing) : void
      {
         var _loc2_:Object = this._3091780draw;
         if(_loc2_ !== param1)
         {
            this._3091780draw = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"draw",_loc2_,param1));
            }
         }
      }
   }
}

