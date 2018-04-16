package hide.comp;
import hide.Element;

class SVG extends Component {

	var document = null;
	public var element(default, null) : hide.Element = null;

	public function new(root: hide.Element) {
		super(root);
		document = root[0].ownerDocument;

		var e = document.createElementNS('http://www.w3.org/2000/svg', 'svg');
		element = new Element(e);
		element.attr("width", "100%");
		element.attr("height", "100%");
		root.append(element);
	}

	public function clear() {
		element.empty();
	}

	public function add(el: Element) {
		element.append(el);
	}

	public function make(?parent: Element, name: String, ?attr: Dynamic, ?style: Dynamic) {
		var e = document.createElementNS('http://www.w3.org/2000/svg', name);
		var el = new Element(e);
		if(attr != null)
			el.attr(attr);
		if(style != null)
			el.css(style);
		if(parent != null)
			parent.append(el);
		return el;
	}

	public function circle(?parent: Element, x:Float, y:Float, radius:Float, ?style:Dynamic) {
		return make(parent, "circle", {cx:x, cy:y, r:radius}, style);
	}

	public function rect(?parent: Element, x:Float, y:Float, width:Float, height:Float, ?style:Dynamic) {
		return make(parent, "rect", {x:x, y:y, width:width, height:height}, style);
	}

	public function line(?parent: Element, x1:Float, y1:Float, x2:Float, y2:Float, ?style:Dynamic) {
		return make(parent, "line", {x1:x1, y1:y1, x2:x2, y2:y2}, style);
	}

	public function group(?parent: Element, ?className: String, ?attr: Dynamic) {
		var g = make(parent, "g", attr);
		if(className != null)
			g.addClass(className);
		return g;
	}
	
	// public function text(x: Float, y: Float, text: String, ?style: Dynamic) {
	// 	var e = make("text", {x:x, y:y}, style);
	// 	e.text(text);
	// 	return e;
	// }
}