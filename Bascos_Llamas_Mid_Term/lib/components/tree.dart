import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird_game/game/assets.dart';
import 'package:flappy_bird_game/game/configuration.dart';
import 'package:flappy_bird_game/game/ibong_adarna_game.dart';
import 'package:flappy_bird_game/game/tree_position.dart';

class Pipe extends SpriteComponent with HasGameRef<IbongAdarna> {
  Pipe({
    required this.treePosition,
    required this.height,
  });

  @override
  final double height;
  final TreePosition treePosition;

  @override
  Future<void> onLoad() async {
    final tree = await Flame.images.load(Assets.tree);
    final treeRotated = await Flame.images.load(Assets.treeRotated);
    size = Vector2(50, height);

    switch (treePosition) {
      case TreePosition.top:
        position.y = 0;
        sprite = Sprite(treeRotated);
        break;
      case TreePosition.bottom:
        position.y = gameRef.size.y - size.y - Config.groundHeight;
        sprite = Sprite(tree);
        break;
    }

    add(RectangleHitbox());
  }
}
