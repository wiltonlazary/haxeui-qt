package haxe.ui.backend.qt.behaviours;

import haxe.ui.behaviours.DataBehaviour;
import haxe.ui.util.Variant;

class ReflectProperty extends DataBehaviour {
    public override function validateData() {
        var targetProp = getConfigValue("targetProperty");
        if (targetProp == null) {
            targetProp = this.id;
        }
        
        /*
        if (targetProp == "pixmapResource") {
            var s:String = _value;
            var b = Resource.getBytes(s);
            trace(s);
            trace(b);
            return;
        }
        */
        
        try {
            Reflect.setProperty(_component.widget, targetProp, Variant.toDynamic(_value));
            _component.widget.adjustSize();
        } catch (e:Dynamic) {
            trace("WARNING: problem setting " + Type.getClassName(Type.getClass(_component.widget)) + "." + targetProp + " property (" + e + ")");
        }
    }
}