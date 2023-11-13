require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'should save successfully when all fields are valid' do
      @user = User.new(
        first_name: 'test_first',
        last_name: 'test_last',
        email: '123@123.com',
        password: 'password',
        password_confirmation: 'password'
        )
      expect(@user).to be_valid
    end

    it 'should not save when first_name is missing' do
      @user = User.new(

        last_name: 'test_last',
        email: '123@123.com',
        password: 'password',
        password_confirmation: 'password'
        )
        expect(@user).to be_invalid
    end

    it 'should not save when last_name is missing' do
      @user = User.new(
        first_name: 'test_first',
        email: '123@123.com',
        password: 'password',
        password_confirmation: 'password'
        )
        expect(@user).to be_invalid
    end

    it 'should not save when email is missing' do
      @user = User.new(
        first_name: 'test_first',
        last_name: 'test_last',
        password: 'password',
        password_confirmation: 'password'
        )
        expect(@user).to be_invalid
    end

    it 'should not save when password is missing' do
      @user = User.new(
        first_name: 'test_first',
        last_name: 'test_last',
        email: '123@123.com',
        password_confirmation: 'password'
        )
        expect(@user).to be_invalid
    end

    it 'should not save when passwords do not match' do
      @user = User.new(
        first_name: 'test_first',
        last_name: 'test_last',
        email: '123@123.com',
        password: 'password',
        password_confirmation: 'pass'
        )
        expect(@user).to be_invalid
    end

    it 'should not save when email is not unique' do
      @user1 = User.new(
        first_name: 'test_first',
        last_name: 'test_last',
        email: 'notunique@email.com',
        password: 'password',
        password_confirmation: 'password'
        )
      @user1.save
      @user2 = User.new(
        first_name: 'test_first',
        last_name: 'test_last',
        email: 'notunique@email.com',
        password: 'password',
        password_confirmation: 'password'
        )
        expect(@user2).to be_invalid
    end

    it 'should not save when password is less than 6 characters' do
      @user = User.new(
        first_name: 'test_first',
        last_name: 'test_last',
        email: 'test@test.com',
        password: 'pass',
        password_confirmation: 'pass'
        )
        expect(@user).to be_invalid
    end


  end
describe '.authenticate_with_credentials' do

  it 'should return user when email and password are valid' do
    @user = User.new(
      first_name: 'test_first',
      last_name: 'test_last',
      email: 'test@testemail.com',
      password: 'password',
      password_confirmation: 'password'
      )
      @user.save
      expect(User.authenticate_with_credentials('test@testemail.com', 'password')).to eq(@user)
  end

  it 'should return nil when email is invalid' do
    @user = User.new(
      first_name: 'test_first',
      last_name: 'test_last',
      email: 'testemail@mail.com',
      password: 'password',
      password_confirmation: 'password'
      )
      @user.save
      expect(User.authenticate_with_credentials('bob@notanemail.com', 'password')).to eq(nil)
  end
  it 'should return true when email has spaces before or after' do
    @user = User.new(
      first_name: 'test_first',
      last_name: 'test_last',
      email: '  test@email.com',
      password: 'password',
      password_confirmation: 'password'
      )
      @user.save
      expect(User.authenticate_with_credentials('  test@email.com', 'password'))

  end

  it 'should return true when email has different case' do
    @user = User.new(
      first_name: 'test_first',
      last_name: 'test_last',
      email: 'test@email.com',
      password: 'password',
      password_confirmation: 'password'
      )
      @user.save
      expect(User.authenticate_with_credentials('TesT@email.COM', 'password'))
end
end
end
