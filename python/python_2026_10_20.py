#!/usr/bin/env python3.10

import random
from dataclasses import dataclass
from typing import List

@dataclass
class Player:
    name: str
    score: int = 0

def roll_dice() -> int:
    """Roll a standard six-sided dice."""
    return random.randint(1, 6)

def play_round(players: List[Player]) -> None:
    """Play one round of the game."""
    for player in players:
        roll = roll_dice()
        player.score += roll
        print(f"{player.name} rolled a {roll}. Total score: {player.score}")

def display_scores(players: List[Player]) -> None:
    """Display current scores."""
    print("\n--- Current Scores ---")
    for player in players:
        print(f"{player.name}: {player.score}")
    print("-" * 25)

def find_winner(players: List[Player]) -> Player:
    """Find player with highest score."""
    return max(players, key=lambda p: p.score)

def main() -> None:
    """Main game loop."""
    player_names = ["Alice", "Bob", "Charlie"]
    players = [Player(name) for name in player_names]
    
    print("Welcome to Dice Game!")
    print(f"Players: {', '.join(p.name for p in players)}\n")
    
    rounds = 5
    for round_num in range(1, rounds + 1):
        print(f"\n=== Round {round_num} ===")
        play_round(players)
        display_scores(players)
    
    winner = find_winner(players)
    print(f"\n🎉 {winner.name} wins with a score of {winner.score}!")

if __name__ == "__main__":
    main()
