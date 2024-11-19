mod chess;

use chess::{Position, Move, is_valid_move, pieces};


fn main(x1: Field, y1: Field, x2: Field, y2: Field) {//, board: [[Field; 8]; 8]) {
    let start = Position { x: x1, y: y1 };
    let end = Position { x: x2, y: y2 };

    let move = Move { start, end };

    is_valid_move(pieces::start_board(), move);
}


#[test]
fn test_pawn_start() {
    main(5, 1,5, 3);
    // main(1, 0, 2, 2);

    // Uncomment to make test fail
    // main(1, 1);
}
